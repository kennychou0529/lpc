
// Copyright 2020 LPC Authors
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     https://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "llvmBackend.h"

#include <limits>

#undef min
#undef max


namespace llvm
{

///////////////////////////////////////////////////////////////////////////////
//
void TypeGen::gen(ts::Type* pType)
{
    auto pExt = ext(pType);
    assert(pExt->genName.empty());
    assert(pExt->def.empty());
    assert(pExt->pMetadata == nullptr);
    
    // set the name and a metadata placeholder early on,
    // so recursive type references can peek at their dependencies
    //
    // types must update the metadata definition and may also update the generic name
    //
    pExt->genName = m_pBackend->_genName(pType->typeId(), "%T_");
    pExt->pMetadata = m_pBackend->_newMetadata(Metadata::Kind::Type, "TODO");

    pType->accept(this);

    assert(pExt->size >= 0);
    assert(pExt->alignment > 0);
    assert(pExt->size % pExt->alignment == 0);
    assert(!pExt->pMetadata->def.empty());
}


///////////////////////////////////////////////////////////////////////////////
//
VarPtr TypeGen::visit(ts::VoidType* pType)
{
    auto pExt = ext(pType);
    pExt->genName = "void";
    pExt->size = 0;
    pExt->alignment = 1;
    pExt->pMetadata->def = "!DIBasicType(name: \"void\", size: 0, encoding: DW_ATE_void)";
    return VarPtr();
}


///////////////////////////////////////////////////////////////////////////////
//
VarPtr TypeGen::visit(ts::IntegerType* pType)
{
    auto pExt = ext(pType);
    pExt->genName = "i32";
    pExt->size = 4;
    pExt->alignment = 4;
    pExt->pMetadata->def = "!DIBasicType(name: \"integer\", size: 32, encoding: DW_ATE_signed)";
    return VarPtr();
}


///////////////////////////////////////////////////////////////////////////////
//
VarPtr TypeGen::visit(ts::CharType* pType)
{
    auto pExt = ext(pType);
    pExt->genName = "i8";
    pExt->size = 1;
    pExt->alignment = 1;
    pExt->pMetadata->def = "!DIBasicType(name: \"char\", size: 8, encoding: DW_ATE_unsigned_char)";
    return VarPtr();
}


///////////////////////////////////////////////////////////////////////////////
//
VarPtr TypeGen::visit(ts::BoolType* pType)
{
    auto pExt = ext(pType);
    pExt->genName = "i1";
    pExt->size = 1;
    pExt->alignment = 1;
    pExt->pMetadata->def = "!DIBasicType(name: \"boolean\", size: 8, encoding: DW_ATE_boolean)";
    return VarPtr();
}


///////////////////////////////////////////////////////////////////////////////
//
VarPtr TypeGen::visit(ts::RealType* pType)
{
    auto pExt = ext(pType);
    pExt->genName = "double";
    pExt->size = 8;
    pExt->alignment = 8;
    pExt->pMetadata->def = "!DIBasicType(name: \"real\", size: 64, encoding: DW_ATE_float)";
    return VarPtr();
}


///////////////////////////////////////////////////////////////////////////////
//
VarPtr TypeGen::visit(ts::EnumType* pType)
{
    auto pExt = ext(pType);
    pExt->genName = "i32";
    pExt->size = 4;
    pExt->alignment = 4;
    pExt->pMetadata->def = "!DIBasicType(name: \"enum\", size: 32, encoding: DW_ATE_signed)";
    return VarPtr();
}

///////////////////////////////////////////////////////////////////////////////
//
VarPtr TypeGen::visit(ts::SetType* pType)
{
    // TODO
    auto pExt = ext(pType);
    pExt->size = 1;
    pExt->alignment = 1;
    pExt->def = "__set";
    return VarPtr();
}


///////////////////////////////////////////////////////////////////////////////
//
// the recursive helper for generating "record" definitions
//
TypeGen::FieldsLayout TypeGen::_fieldsLayout(const ts::RecordFields* pFields, int offset)
{
    vector<Field> fieldsDef;
    int alignment = 1;

    // add field helper
    //
    const auto addField = [&](const Identifier* pId, ts::Type* pType)
    {
        auto pExt = ext(pType);

        assert(pExt->size > 0);
        assert(pExt->alignment > 0);
        assert(!pExt->genName.empty());

        // align the offset
        //
        offset += pExt->alignment - 1;
        offset -= offset % pExt->alignment;

        fieldsDef.push_back({ pId, pType, offset });

        // update the offset & alignment
        //
        offset += pExt->size;
        alignment = LCM(alignment, pExt->alignment);
    };

    // fixed fields
    //
    if(pFields->pFixedFields != nullptr)
    {
        for (const auto& fieldSet : *pFields->pFixedFields)
        {
            const auto pFieldType = fieldSet->pType;
            m_pBackend->_generateType(pFieldType);

            for (const auto& id : *fieldSet->pNames)
            {
                addField(id, pFieldType);
            }
        }
    }

    // variable fields & tag
    //
    if(pFields->pVariableFields != nullptr)
    {
        const auto pSelField = pFields->pVariableFields->pVariantSelector;

        if(pSelField->pId != nullptr)
        {
            m_pBackend->_generateType(pSelField->pType);
            addField(pSelField->pId, pSelField->pType);
        }

        int varFieldsSize = 0;

        for (const auto& variantSection : *pFields->pVariableFields->pVariantFields)
        {
            const auto varFieldsLayout = _fieldsLayout(variantSection->pFields, offset);

            fieldsDef.insert(fieldsDef.end(),
                varFieldsLayout.fields.begin(), varFieldsLayout.fields.end());

            varFieldsSize = max(varFieldsSize, varFieldsLayout.size);
            alignment = LCM(alignment, varFieldsLayout.alignment);
        }

        offset += varFieldsSize;
    }

    return { fieldsDef, offset, alignment };
}


///////////////////////////////////////////////////////////////////////////////
//
// the records map to an LLVM IR, so we can
// control the precise layout (including variant fields)
//
VarPtr TypeGen::visit(ts::RecordType* pType)
{
    auto pExt = ext(pType);
    const auto fieldsLayout = _fieldsLayout(pType->fields());

    stringstream def;

    def << "[" << fieldsLayout.size << " x i8]";

    pExt->def = def.str();
    pExt->alignment = fieldsLayout.alignment;
    pExt->size = roundUp(fieldsLayout.size, fieldsLayout.alignment);

    // build the name -> offset map
    //
    for(const auto& [pId, _, offset] : fieldsLayout.fields)
    {
        const bool inserted = pExt->fields.insert({ pId->name, offset }).second;
        assert(inserted);
    }

    // debug information
    //
    stringstream fieldsList;
    fieldsList << "!{";
    bool firstField = true;
    for(const auto& [pId, pFieldType, offset] : fieldsLayout.fields)
    {
        stringstream def;
        def << "!DIDerivedType(tag: DW_TAG_member, " <<
            "name: \"" << pId->name << "\", " <<
            "scope: " << pExt->pMetadata->id << ", " <<
            "file: " << m_pBackend->m_sourceFileMd->id << ", " <<
            "line: " << pId->line << ", " <<
            "baseType: " << ext(pFieldType)->pMetadata->id << ", " <<
            "size: " << ext(pFieldType)->size * 8 << ", " <<
            "offset: " << offset * 8 << ")";
        
        auto fieldMd = m_pBackend->_newMetadata(Metadata::Kind::Field, def.str());
        if (!firstField)
            fieldsList << ",";
        fieldsList << fieldMd->id;
        firstField = false;
    }
    fieldsList << "}";

    auto elementsMd = m_pBackend->_newMetadata(Metadata::Kind::Generic, fieldsList.str());

    stringstream typeName;
    if (pType->isUserDeclared())
        typeName << "name: \"" << pType->typeId() << "\", ";

    stringstream md;
    md << "distinct !DICompositeType(tag: DW_TAG_structure_type, " <<
        typeName.str() <<
        "file: " << m_pBackend->m_sourceFileMd->id << ", " <<
        "line: " << pType->line() << ", " <<
        "size: " << pExt->size * 8 << ", " <<
        "flags: DIFlagTypePassByValue, " <<
        "elements: " << elementsMd->id << ")";
    pExt->pMetadata->def = md.str();

    return VarPtr();
}


///////////////////////////////////////////////////////////////////////////////
//
VarPtr TypeGen::visit(ts::ArrayType* pType)
{
    // TODO
    auto pExt = ext(pType);
    pExt->size = 1;
    pExt->alignment = 1;
    pExt->def = "__array";
    return VarPtr();
}


///////////////////////////////////////////////////////////////////////////////
//
VarPtr TypeGen::visit(ts::PointerType* pType)
{
    const auto pBaseType = pType->baseType();
    m_pBackend->_generateType(pBaseType);

    auto pExt = ext(pType);

    stringstream def;
    if (pBaseType->isVoid())
        def << "i8*";
    else
        def << ext(pBaseType)->genName << "*";
    pExt->def = def.str();

    pExt->size = PTR_SIZE;
    pExt->alignment = PTR_ALIGNMENT;

    // debug information
    //
    stringstream typeName;
    if (pType->isUserDeclared())
        typeName << "name: \"" << pType->typeId() << "\", ";

    stringstream md;
    md << "!DIDerivedType(tag: DW_TAG_pointer_type, " <<
        typeName.str() <<
        "file: " << m_pBackend->m_sourceFileMd->id << ", " <<
        "line: " << pType->line() << ", " <<
        "baseType: " << ext(pBaseType)->pMetadata->id << ", " <<
        "size: 64)";
    pExt->pMetadata->def = md.str();

    return VarPtr();
}


///////////////////////////////////////////////////////////////////////////////
//
VarPtr TypeGen::visit(ts::FileType* pType)
{
    // TODO
    auto pExt = ext(pType);
    pExt->size = 1;
    pExt->alignment = 1;
    pExt->def = "__file";
    return VarPtr();
}


///////////////////////////////////////////////////////////////////////////////
//
VarPtr TypeGen::visit(ts::SubroutineType* pType)
{
    // TODO
    auto pExt = ext(pType);
    pExt->size = 1;
    pExt->alignment = 1;
    pExt->def = "__subroutine";
    return VarPtr();
}


///////////////////////////////////////////////////////////////////////////////
//
VarPtr TypeGen::visit(ts::RangeType* pType)
{
    // TODO
    auto pExt = ext(pType);
    pExt->size = 1;
    pExt->alignment = 1;
    pExt->def = "__range";
    return VarPtr();
}


///////////////////////////////////////////////////////////////////////////////
//
void LlvmBackend::_outputMetadata()
{
    auto filterMetadata = [&](Metadata::Kind kind)
    {
        stringstream md;
        md << "!{";
        bool first = true;
        for (auto pMetadata : m_metadata)
        {
            if (pMetadata->kind == kind)
            {
                if (!first)
                    md << ",";
                md << pMetadata->id;
                first = false;
            }
        }
        md << "}";
        return md.str();
    };

    auto typesMd = _newMetadata(Metadata::Kind::Generic,
        filterMetadata(Metadata::Kind::Type));

    auto enumsMd = _newMetadata(Metadata::Kind::Generic,
        filterMetadata(Metadata::Kind::Enum));

    auto globalsMd = _newMetadata(Metadata::Kind::Generic,
        filterMetadata(Metadata::Kind::Global));

    // version
    //
    stringstream version;
    version << "!{!\"" << BUILD_STRING << "\"}";
    auto versionMd = _newMetadata(Metadata::Kind::Generic, version.str());

    // compile unit metadata
    //
    stringstream compileUnit;
    compileUnit << "distinct !DICompileUnit(" <<
        "language: DW_LANG_Pascal83, " <<
        "file: " << m_sourceFileMd->id << ", " <<
        "producer: \"" << BUILD_STRING << "\", " <<
        "isOptimized: true, " <<
        "runtimeVersion: 0, " <<
        "emissionKind: FullDebug, " <<
        "enums: " << enumsMd->id << ", " <<
        "retainedTypes: " << typesMd->id << ", " <<
        "globals: " << globalsMd->id << ", " <<
        "nameTableKind: None)";
    auto compileUnitMd = _newMetadata(Metadata::Kind::Generic, compileUnit.str());

    std::stringstream code;

    code << ";================================================================================\n";
    code << "; metadata\n";
    code << "\n";
    code << "!llvm.dbg.cu = !{" << compileUnitMd->id << "}\n";
    code << "!llvm.module.flags = !{}\n";
    code << "!llvm.ident = !{" << versionMd->id << "}\n";
    code << "\n";
    for (auto pMetadata : m_metadata)
    {
        code << pMetadata->id << " = " << pMetadata->def << "\n";
    }
    code << "\n";

    write(code);
}

} // end namespace llvm


