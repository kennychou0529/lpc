
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

// backend emitting LLVM code

#pragma once

#include "symbols.h"
#include "ast.h"
#include "objects.h"
#include "types.h"
#include "compilationContext.h"
#include "backend.h"
#include "_parser.h"

#include <string>
#include <vector>
#include <map>
#include <unordered_map>
#include <sstream>
#include <tuple>
#include <iomanip>
#include <filesystem>
#include <memory>

using namespace std;


namespace llvm
{

class LlvmBackend;


///////////////////////////////////////////////////////////////////////////////
//
// LLVM metadata
//
struct Metadata
{
    enum class Kind { None, Generic, Type, Enum, Global, Field };

    string id;
    string def;
    Kind kind = Kind::None;
};


///////////////////////////////////////////////////////////////////////////////
//
// A contiguous llvm IR fragment. May contain multiple basic blocks.
//
// code: zero or more LLVM IR instructions
// value: the result of the code, if any
//
struct IrFragment
{
    string code;
    string value;
};


///////////////////////////////////////////////////////////////////////////////
//
struct StringLiteral
{
    string name;
    string llvmType;
    string address;
};


///////////////////////////////////////////////////////////////////////////////
//
inline
VarPtr newIrFragment(const string& code, const string& value)
{
    return VarPtr(new IrFragment{code, value});
}


///////////////////////////////////////////////////////////////////////////////
//
// backend specific information for various data structures
//
struct TypeExt
{
    // type name (it may be one of the LLVM built-in type names)
    //
    string genName;

    // the LLVM IR definition of the type
    // (may be empty if it maps to a built-in type)
    //
    string def;

    // the size and alignment in bytes
    //
    int size = -1;
    int alignment = -1;

    // debug information
    //
    Metadata* pMetadata = nullptr;

    // field -> offset mapping
    // (for record types)
    //
    unordered_map<string, int> fields;
};

struct ConstExt
{
    string genName;
};

struct VarExt
{
    string genName;
    int frameIndex = -1;
};

struct ParamExt
{
    string genName;
    int frameIndex = -1;
};

struct SubroutineExt
{
    string frameName;
    int slinkIndex = -1;
};

struct ScopeExt
{
    string genName;
};

struct LabelExt
{
    string genName;
};


///////////////////////////////////////////////////////////////////////////////
//
// extension information helpers
//
template<class E, class T>
E* getExt(T* p)
{
    E* pExt = p->ext.get<E>();

    if(nullptr == pExt)
    {
        pExt = new E();
        p->ext = VarPtr(pExt);
    }

    return pExt;
}

inline TypeExt* ext(ts::Type* pType) { return getExt<TypeExt>(pType); }
inline ConstExt* ext(obj::Constant* pConst) { return getExt<ConstExt>(pConst); }
inline VarExt* ext(obj::Variable* pVar) { return getExt<VarExt>(pVar); }
inline ParamExt* ext(obj::Parameter* pParam) { return getExt<ParamExt>(pParam); }
inline SubroutineExt* ext(obj::Subroutine* pSubroutine) { return getExt<SubroutineExt>(pSubroutine); }
inline ScopeExt* ext(Scope* pScope) { return getExt<ScopeExt>(pScope); }
inline LabelExt* ext(obj::Label* pLabel) { return getExt<LabelExt>(pLabel); }


///////////////////////////////////////////////////////////////////////////////
//
// helper functions
//
inline
string genBlock(const string& str)
{
    return "{\n" + indentBlock(str) + "}";
}

inline
string labelName(const obj::Label* pLabel)
{
    assert(pLabel->labelId > 0);

    stringstream name;
    name << "L_" << pLabel->labelId;
    return name.str(); 
}

// this is the magic "hidden" line number used to mark compiler-generated code
//
constexpr int HIDDEN_CODE = 0xfeefee;

// outputs a line # comment
inline
string genLine(int line)
{
    if(line == -1)
        line = 0;

    stringstream code;

    if(line == HIDDEN_CODE)
        code << "; compiler-generated\n";
    else
        code << "; line " << line << "\n";

    return code.str();
}

// generates a string literal (without the quotes)
// that escapes a set of characters to make it a legal C string literal
//
inline
string genStrLiteral(const string& str)
{
    string result = "";

    for(size_t i = 0; i < str.length(); ++i)
    {
        switch(str[i])
        {
        case '"':   result += "\\\""; break;
        case '\\':  result += "\\\\"; break;
        default:    result += str[i]; break;
        }
    }

    return result;
}

// generate a scope "path" name (ex. foo_bar_x)
//
inline
string genScopeName(Scope* pScope)
{
    assert(pScope->category != Scope::scRecord);

    auto pExt = ext(pScope);

    if(!pExt->genName.empty())
        return pExt->genName;

    if(pScope->category == Scope::scSubroutine)
    {
        pExt->genName = pScope->pSubroutine->pId->name;

        auto parentName = genScopeName(pScope->pParent);
        if(!parentName.empty())
        {
            pExt->genName = parentName + "_" + pExt->genName;
        }
    }
    else
    {
        pExt->genName = "";
    }

    return pExt->genName;
}


///////////////////////////////////////////////////////////////////////////////
//
// a type definition generator
//
// NOTE: this implementation of the ts::Visitor doesn't use the return value
//  from the "visit()" methods (it sets the appropriate TypeExt fields instead)
//
class TypeGen : public ts::Visitor
{
    // the size/alignment of a pointer
    // (we use 8 bytes to make things run across 32/64bit platforms)
    //
    static constexpr int PTR_SIZE = 8;
    static constexpr int PTR_ALIGNMENT = 8;

    struct Field
    {
        const Identifier* pId = nullptr;
        ts::Type* pType = nullptr;
        int offset = -1;
    };

    struct FieldsLayout
    {
        vector<Field> fields;
        int size = -1;
        int alignment = -1;
    };

public:
    TypeGen(LlvmBackend* pBackend) : m_pBackend(pBackend) {}

public:
    void gen(ts::Type* pType);

private:
    VarPtr visit(ts::VoidType* pType) override;
    VarPtr visit(ts::IntegerType* pType) override;
    VarPtr visit(ts::CharType* pType) override;
    VarPtr visit(ts::BoolType* pType) override;
    VarPtr visit(ts::RealType* pType) override;
    VarPtr visit(ts::EnumType* pType) override;
    VarPtr visit(ts::SetType* pType) override;
    VarPtr visit(ts::RecordType* pType) override;
    VarPtr visit(ts::ArrayType* pType) override;
    VarPtr visit(ts::PointerType* pType) override;
    VarPtr visit(ts::FileType* pType) override;
    VarPtr visit(ts::SubroutineType* pType) override;
    VarPtr visit(ts::RangeType* pType) override;

    FieldsLayout _fieldsLayout(const ts::RecordFields* pFields, int offset = 0);

private:
    LlvmBackend* m_pBackend = nullptr;
};


///////////////////////////////////////////////////////////////////////////////
//
class LlvmBackend : public Backend, public ast::Visitor
{
    friend class TypeGen;

private:
    Scope* m_pCurrentScope = nullptr;

    // per-subroutine state
    //
    vector<ts::Type*> m_typeList; 
    vector<obj::Variable*> m_varList;
    vector<obj::Parameter*> m_paramList;
    vector<obj::Variable*> m_cleanupList;
    vector<obj::Label*> m_nonLocalLabels;

    int m_tempValueGen = 0;
    int m_labelGen = 0;

    // global (per-program) state
    //
    map<string, StringLiteral*> m_stringLiterals;
    int m_stringLiteralGen = 0;

    vector<Metadata*> m_metadata;
    int m_metadataIdGen = 0;

    const Metadata* m_sourceFileMd = nullptr;

public:
    LlvmBackend() = default;

    const char* targetName() const override { return "llvm"; }

private:
    Metadata* _newMetadata(Metadata::Kind kind, const string& def)
    {
        stringstream newMetadataId;
        newMetadataId << "!" << m_metadataIdGen++;

        auto pMetadata = new Metadata{ newMetadataId.str(), def, kind };
        m_metadata.push_back(pMetadata);

        return pMetadata;
    }

    const StringLiteral* _genLiteral(const string& str)
    {
        if (auto it = m_stringLiterals.find(str); it != m_stringLiterals.end())
        {
            return it->second;
        }

        // generate string literal name
        //
        stringstream literalName;
        literalName << "@.str." << m_stringLiteralGen++;

        // generate llvm type
        //
        stringstream llvmType;
        llvmType << "[" << str.length() + 1 << " x i8]";

        // address value (as i8*)
        //
        stringstream address;
        address << "getelementptr inbounds (" <<
            llvmType.str() << ", " << llvmType.str() << "* " <<
            literalName.str() << ", i32 0, i32 0)";

        auto newLiteral = new StringLiteral{
            literalName.str(), llvmType.str(), address.str() };
        m_stringLiterals.insert({ str, newLiteral });
        return newLiteral;
    }

    // sets the current scope name
    //
    void _setCurrentScope(Scope* pScope)
    {
        m_pCurrentScope = pScope;

        string friendlyName = genScopeName(m_pCurrentScope);

        if(pScope->category == Scope::scGlobal)
        {
            friendlyName = "global scope";
        }
        else if(pScope->category == Scope::scProgram)
        {
            friendlyName = "program scope";
        }

        context()->info("compiling scope: %s [%d]",
            friendlyName.c_str(), pScope->level);
        
        stringstream code;
        code << "\n" << genLine(m_pCurrentScope->line);
        code << ";================================================================================\n";
        code << "; scope: " << friendlyName << " (level : " << m_pCurrentScope->level << ")\n";
        write(code);
    }

    // generates a identifier annotated name for code generation
    // ( the format pattern is : [prefix][scopeName]idName )
    //
    string _genName(const string& idName, const string& prefix, Scope* pScope = nullptr) const
    {
        string scopeName = genScopeName(nullptr != pScope ? pScope : m_pCurrentScope);

        return scopeName.empty() ?
            prefix + idName :
            (idName.empty() ? 
                prefix + scopeName :
                prefix + scopeName + "_" + idName);
    }

    string _genName(obj::Subroutine* pSubroutine) const
    {
        const bool isFunction = pSubroutine->pType->isFunction();
        const char* prefix = isFunction ? "@F_" : "@P_";
        return _genName("", prefix, pSubroutine->pScope);
    }

    // generates a local label for code generation (flow) purposes
    //
    // L_<prefix>_<N>
    //
    string _genLabel(const char* prefix)
    {
        stringstream label;
        label << "L_" << prefix << "_" << m_labelGen++;
        return label.str();
    }

    // safe wrapper around the AST visitor interface
    //
    unique_ptr<IrFragment> gen(const ast::Node* pNode)
    {
        return unique_ptr<IrFragment>(pNode->accept(this).get<IrFragment>());
    }

    // backend interface
    //
private:
    const char* _outputExt() const override { return ".ll"; }

    void _outputStringLiterals();
    void _outputMetadata();

    void _start() override;
    void _end() override;

    string _genTempValue()
    {
        stringstream tempValueName;
        tempValueName << "%t" << m_tempValueGen++;
        return tempValueName.str();
    }

    // this is the main entry point for generating code for a scope
    //
    void _generate(Scope* pScope, bool postOrder) override
    {
        assert(pScope->category != Scope::scRecord);

        if(postOrder)
            return;
        
        _setCurrentScope(pScope);

        // reset per-function state
        //
        m_typeList.clear();
        m_varList.clear();
        m_paramList.clear();
        m_cleanupList.clear();
        m_nonLocalLabels.clear();
        m_tempValueGen = 1;
        m_labelGen = 1;

        // generate symbols (types, consts, locals...)
        //
        for(const auto& [_, pSymbol] : pScope->symMap)
        {
            switch (pSymbol->category)
            {
            case Symbol::scConst:
                _generateConst(pSymbol->pId->name, pSymbol->pConstant);
                break;
            case Symbol::scParameter:
                _generateParam(pSymbol->pId->name, pSymbol->pParameter);
                break;
            case Symbol::scVariable:
                _generateVar(pSymbol->pId->name, pSymbol->pVariable);
                break;
            case Symbol::scType:
                _generateType(pSymbol->pType);
                break;
            case Symbol::scLabel:
                _generateLabel(pSymbol->pLabel);
                break;
            default:
                // nothing to do for other kinds of symbols
                break;
            }
        }

        _outputTypes();

        // generate the subroutine definition
        // (including the activation record)
        //
        if(pScope->category == Scope::scProgram ||
            pScope->category == Scope::scSubroutine)
        {
            assert(pScope->pSubroutine->pScope == pScope);
            _outputFrame(pScope->pSubroutine);
            _outputSubroutine(pScope->pSubroutine);
        }
    }

    void _outputFrame(obj::Subroutine* pSubroutine);

    void _outputSubroutine(obj::Subroutine* pSubroutine);

    void _outputTypes()
    {
        if (m_typeList.empty())
            return;

        std::stringstream code;

        code << "\n; types\n";

        for (auto pType : m_typeList)
        {
            const auto pExt = ext(pType);
            code << pExt->genName << " = type " << pExt->def << "\n";
        }

        write(code);
    }

    void _generateType(ts::Type* pType)
    {
        auto pExt = ext(pType);

        // if it has a name we can assume it's been already generated
        //
        if(pExt->genName.empty())
        {
            TypeGen(this).gen(pType);
            assert(!pExt->genName.empty());

            if(!pExt->def.empty())
                m_typeList.push_back(pType);
        }
    }

    void _generateLabel(obj::Label* pLabel)
    {
        auto pExt = ext(pLabel);
        assert(pExt->genName.empty());
        pExt->genName = labelName(pLabel);

        if(pLabel->isNonLocalTarget())
            m_nonLocalLabels.push_back(pLabel);
    }

    void _generateConst(const string& idName, obj::Constant* pConst)
    {
        _generateType(pConst->pType);
    }

    void _generateParam(const string& idName, obj::Parameter* pParam)
    {
        assert(m_pCurrentScope->category == Scope::scSubroutine);

        _generateType(pParam->pType);

        auto pExt = ext(pParam);
        assert(pExt->genName.empty());
        pExt->genName = "%" + idName;

        m_paramList.push_back(pParam);
    }

    void _generateVar(const string& idName, obj::Variable* pVar)
    {
        _generateType(pVar->pType);

        if (pVar->pScope->level <= Scope::PROGRAM_SCOPE_LEVEL)
        {
            auto pExt = ext(pVar);
            assert(pExt->genName.empty());
            pExt->genName = "@" + idName;
        }

        m_varList.push_back(pVar);
    }

    // AST visitor interface
    //
private:
    VarPtr visit(const ast::ConstExpr* pConstExpr) override
    {
        const auto* pType = pConstExpr->pType;
        const auto* pConst = pConstExpr->pConstant;
        stringstream value;

        if (pType->isString())
        {
            auto literal = _genLiteral(*pConst->strValue);
            value << literal->address;
        }
        else if (pType->isInteger())
        {
            value << pConst->intValue;
        }
        else if (pType->isReal())
        {
            value << std::showpoint << pConst->realValue;
        }
        else if (pType->isBool())
        {
            value << pConst->intValue;
        }
        else if (pType->isChar())
        {
            value << pConst->intValue;
        }
        else if (pType->isPointer())
        {
            value << "null";
        }

        return newIrFragment("", value.str());
    }

    // ast::Intrinsic should only appear part of a intrinsic call
    //
    VarPtr visit(const ast::Intrinsic*) override
    {
        assert(!"not implemented");
        return VarPtr();
    }

    VarPtr visit(const ast::VarExpr* pVarExpr) override
    {
        auto pVar = pVarExpr->pVariable;

        const auto value = _genTempValue();
        const auto& irType = ext(pVar->pType)->genName;
        const auto varPtrIr = _genVarAddress(pVar);

        stringstream code;

        code << varPtrIr.code;

        // load the value
        //
        code << TAB << value << " = load " << irType << ", " <<
            irType << "* " << varPtrIr.value << "\n";

        return newIrFragment(code.str(), value);
    }

    VarPtr visit(const ast::ParamExpr* pParamExpr) override
    {
        auto pParam = pParamExpr->pParameter;

        const auto value = _genTempValue();
        const auto& irType = ext(pParam->pType)->genName;
        const auto paramPtrIr = _genParamAddress(pParam);

        stringstream code;

        code << paramPtrIr.code;

        // load the value
        //
        code << TAB << value << " = load " << irType << ", " <<
            irType << "* " << paramPtrIr.value << "\n";

        return newIrFragment(code.str(), value);
    }

    // generates a "subroutine pointer object"
    //
    VarPtr visit(const ast::FuncPtr* pFuncPtr) override
    {
        auto pFunc = pFuncPtr->pFunc;
        auto pScope = pFunc->pScope;

        stringstream code;
        // TODO
        auto value = "%.dummy";
        return newIrFragment(code.str(), value);
    }

    // generates the actual cast and value checks as needed
    //
    VarPtr visit(const ast::TypeCast* pTypeCast) override
    {
        auto pSrcType = pTypeCast->pExpr->pType;
        auto pDstType = pTypeCast->pType;

        // child expression
        //
        const auto valueIr = gen(pTypeCast->pExpr);

        stringstream code;
        string value = valueIr->value;

        code << valueIr->code;

        // TODO: value checks

        // actual cast code (if needed)
        //
        if(pDstType->isReal() && pSrcType->isInteger())
        {
            value = _genTempValue();
            code << TAB << value << " = sitofp i32 " << valueIr->value << " to double\n";
        }
        else if(pDstType->isSet())
        {
            assert(pSrcType->isSet());

            // no need for a cast if the underlaying implementation is the same
            //
            if(ext(pSrcType)->genName != ext(pDstType)->genName)
            {
                // TODO
                value = "%.dummy_set";
            }
        }

        return newIrFragment(code.str(), value);
    }

    // generates the code for the right (op, T1, T2) operator overload
    //
    VarPtr visit(const ast::BinaryOp* pBinaryOp) override
    {
        auto pLeft = pBinaryOp->pLeft;
        auto pRight = pBinaryOp->pRight;

        const auto pResultType = pBinaryOp->pType;
        const auto token = pBinaryOp->pOperator->token;

        stringstream code;
        auto result = _genTempValue();

        // strings?
        //
        if (pLeft->pType->isString())
        {
            assert(pResultType->isBool());
            assert(pRight->pType->isCompatible(pLeft->pType));

            string helper;

            switch (token)
            {
            case Parser::T_EQ:  helper = "_StrcmpEQ"; break;
            case Parser::T_NE:  helper = "_StrcmpNE"; break;
            case Parser::T_LT:  helper = "_StrcmpLT"; break;
            case Parser::T_GT:  helper = "_StrcmpGT"; break;
            case Parser::T_LE:  helper = "_StrcmpLE"; break;
            case Parser::T_GE:  helper = "_StrcmpGE"; break;

            default:
                assert(!"unexpected string operator");
            }

            const auto leftStrIr = _getStringAddress(pLeft);
            const auto rightStrIr = _getStringAddress(pRight);
            const auto leftStrLen = pLeft->pType->as<ts::ArrayType>()->strLength();
            const auto rightStrLen = pRight->pType->as<ts::ArrayType>()->strLength();

            code << leftStrIr.code;
            code << rightStrIr.code;

            code << TAB << result << " = call i1 @" << helper << "(" <<
                "i8* " << leftStrIr.value << ", i32 " << leftStrLen << ", " <<
                "i8* " << rightStrIr.value << ", i32 " << rightStrLen << ")\n";
        }
        // a IN b ?
        //
        else if(token == Parser::T_IN)
        {
            assert(pResultType->isBool());
            assert(pLeft->pType->isOrdinal());
            assert(pRight->pType->isSet());

            // TODO
            result = "true";
        }
        // set operator overloads?
        //
        else if(pLeft->pType->isSet())
        {
            assert(pRight->pType->isSameType(pLeft->pType));
            assert(pResultType->isSet() || pResultType->isBool());

            string helper;
            bool logicalNot = false;

            switch (token)
            {
            case Parser::T_EQ:      helper = "Equal"; break;
            case Parser::T_LE:      helper = "IsSubset"; break;
            case Parser::T_PLUS:    helper = "Union"; break;
            case Parser::T_MINUS:   helper = "Difference"; break;
            case Parser::T_STAR:    helper = "Intersection"; break;

            case Parser::T_NE:
                logicalNot = true;
                helper = "Equal";
                break;
                 
            case Parser::T_GE:
                std::swap(pLeft, pRight);
                helper = "IsSubset";
                break;

            default:
                assert(!"unexpected operator");
            }

            // TODO
            result = "true";
        }
        // boolean and/or operators?
        //
        // NOTE: the Pascal specification doesn't guarantee short-circuit semantics
        // for logical AND/OR operators but some of the existing programs depend on it
        //
        else if(token == Parser::T_AND || token == Parser::T_OR)
        {
            assert(pResultType->isBool());
            assert(pLeft->pType->isBool());
            assert(pRight->pType->isBool());

            // the Pascal specification doesn't guarantee short-circuit semantics
            // for logical AND/OR operators but some of the existing programs depend on it
            //
            const auto leftIr = gen(pLeft);
            const auto rightIr = gen(pRight);
            const auto exprLabel = _genLabel("expr");

            code << exprLabel << ":\n";

            if (token == Parser::T_OR)
            {
                const auto evalLabel = _genLabel("OR_eval");
                const auto shortcutLabel = _genLabel("OR_shortcut");

                code << leftIr->code;
                code << TAB << "br i1 " << leftIr->value <<
                    ", label %" << shortcutLabel <<
                    ", label %" << evalLabel << "\n";
                code << evalLabel << ":\n";
                code << rightIr->code;
                code << TAB << "br label %" << shortcutLabel << "\n";
                code << shortcutLabel << ":\n";
                code << TAB << result << " = phi " <<
                    "[" << rightIr->value << ", %" << evalLabel << "], " <<
                    "[true, %" << exprLabel << "]\n";
            }
            else
            {
                const auto evalLabel = _genLabel("AND_eval");
                const auto shortcutLabel = _genLabel("AND_shortcut");

                code << leftIr->code;
                code << TAB << "br i1 " << leftIr->value <<
                    ", label %" << evalLabel <<
                    ", label %" << shortcutLabel << "\n";
                code << evalLabel << ":\n";
                code << rightIr->code;
                code << TAB << "br label %" << shortcutLabel << "\n";
                code << shortcutLabel << ":\n";
                code << TAB << result << " = phi " <<
                    "[" << rightIr->value << ", %" << evalLabel << "], " <<
                    "[false, %" << exprLabel << "]\n";
            }
        }
        // everything else...
        //
        else
        {
            const auto leftIr = gen(pLeft);
            const auto rightIr = gen(pRight);

            string leftValue = leftIr->value;
            string rightValue = rightIr->value;

            code << leftIr->code;
            code << rightIr->code;

            // implicit conversion to "real"?
            //
            const bool castToReal = 
                token == Parser::T_SLASH ||
                pLeft->pType->isReal() ||
                pRight->pType->isReal();

            if (castToReal && pLeft->pType->isInteger())
            {
                const auto tmp = _genTempValue();
                code << TAB << tmp << " = sitofp i32 " << leftValue << " to double\n";
                leftValue = tmp;
            }

            if (castToReal && pRight->pType->isInteger())
            {
                const auto tmp = _genTempValue();
                code << TAB << tmp << " = sitofp i32 " << rightValue << " to double\n";
                rightValue = tmp;
            }

            string instr;

            // operator-specific code generation
            //
            switch (token)
            {
            case Parser::T_EQ:
                instr = castToReal ? "fcmp ueq double" : "icmp eq i32";
                break;

            case Parser::T_LT:
                instr = castToReal ? "fcmp ult double" : "icmp slt i32";
                break;

            case Parser::T_GT:
                instr = castToReal ? "fcmp ugt double" : "icmp sgt i32";
                break;

            case Parser::T_NE:
                instr = castToReal ? "fcmp une double" : "icmp ne i32";
                break;

            case Parser::T_LE:
                instr = castToReal ? "fcmp ule double" : "icmp sle i32";
                break;

            case Parser::T_GE:
                instr = castToReal ? "fcmp uge double" : "icmp sge i32";
                break;

            case Parser::T_PLUS:
                instr = castToReal ? "fadd double" : "add i32";
                break;

            case Parser::T_MINUS:
                instr = castToReal ? "fsub double" : "sub i32";
                break;

            case Parser::T_STAR:
                instr = castToReal ? "fmul double" : "mul i32";
                break;

            case Parser::T_DIV:
            case Parser::T_SLASH:
                instr = castToReal ? "fdiv double" : "sdiv i32";
                break;

            case Parser::T_MOD:
                assert(pLeft->pType->isInteger());
                assert(!castToReal);
                instr = "srem i32";
                break;

            default:
                assert(!"unexpected operator");
            }

            code << TAB << result << " = " << instr << " " <<
                leftValue << ", " << rightValue << "\n";
        }

        return newIrFragment(code.str(), result);
    }

    VarPtr visit(const ast::UnaryOp* pUnaryOp) override
    {
        const auto operandIr = gen(pUnaryOp->pExpr);

        stringstream code;
        string result;

        code << operandIr->code;

        switch (pUnaryOp->pOperator->token)
        {
        case Parser::T_PLUS:
            assert(pUnaryOp->pType->isNumber());
            // nop
            result = operandIr->value;
            break;

        case Parser::T_MINUS:
            assert(pUnaryOp->pType->isNumber());
            result = _genTempValue();
            if (pUnaryOp->pType->isReal())
                code << TAB << result << " = fneg double " << operandIr->value << "\n";
            else
                code << TAB << result << " = sub i32 0, " << operandIr->value << "\n";
            break;

        case Parser::T_NOT:
            assert(pUnaryOp->pType->isBool());
            result = _genTempValue();
            code << TAB << result << " = icmp eq 0, " << operandIr->value << "\n";
            break;

        default:
            assert(!"unexpected operator");
        }

        return newIrFragment(code.str(), result);
    }

    VarPtr visit(const ast::ArrayIndex* pArrayIndex) override
    {
        auto ptrIr = _genLValueAddress(pArrayIndex);
        const auto irType = ext(pArrayIndex->pType)->genName;
        const auto value = _genTempValue();

        stringstream code;

        code << ptrIr.code;

        code << TAB << value << " = load " << irType << ", " <<
            irType << "* " << ptrIr.value << "\n";

        return newIrFragment(code.str(), value);
    }

    VarPtr visit(const ast::FieldExpr* pFieldUse) override
    {
        auto ptrIr = _genLValueAddress(pFieldUse);
        const auto irType = ext(pFieldUse->pType)->genName;
        const auto value = _genTempValue();

        stringstream code;

        code << ptrIr.code;

        code << TAB << value << " = load " << irType << ", " <<
            irType << "* " << ptrIr.value << "\n";

        return newIrFragment(code.str(), value);
    }

    VarPtr visit(const ast::Indirection* pIndirection) override
    {
        auto ptrIr = _genLValueAddress(pIndirection);
        const auto irType = ext(pIndirection->pType)->genName;
        const auto value = _genTempValue();

        stringstream code;

        code << ptrIr.code;

        code << TAB << value << " = load " << irType << ", " <<
            irType << "* " << ptrIr.value << "\n";

        return newIrFragment(code.str(), value);
    }

    IrFragment _expandRead(ast::ExprList* pArguments, bool readln)
    {
        stringstream code;
        // TODO
        return { code.str(), "" };
    }

    IrFragment _expandWrite(ast::ExprList* pArguments, bool writeln)
    {
        stringstream code;

        auto it = pArguments->begin();

        // first argument is always the file
        //
        auto pFile = *it++;
        assert(pFile->pType->isFile());
        auto pFileHandleIr = gen(pFile);
        code << pFileHandleIr->code;

        // values
        //
        for (; it != pArguments->end(); ++it)
        {
            auto pValue = *it;

            string widthValue = "0";
            string precisionValue = "0";

            // formatted argument?
            //
            if(auto pWriteArgExpr = pValue->as<ast::WriteArgExpr>())
            {
                // width (optional)
                //
                if (pWriteArgExpr->pWidth != nullptr)
                {
                    auto widthValueIr = gen(pWriteArgExpr->pWidth);
                    code << widthValueIr->code;
                    widthValue = widthValueIr->value;
                }

                // precision (optional)
                //
                if (pWriteArgExpr->pPrecision != nullptr)
                {
                    auto precisionValueIr = gen(pWriteArgExpr->pPrecision);
                    code << precisionValueIr->code;
                    precisionValue = precisionValueIr->value;
                }

                pValue = pWriteArgExpr->pValue;
            }

            stringstream valueArgs;
            string helper;

            auto pType = pValue->pType;

            if (pType->isString())
            {
                auto valueIr = _getStringAddress(pValue);
                code << valueIr.code;
                valueArgs << "i8* " << valueIr.value <<
                    ", i32 " << pType->as<ts::ArrayType>()->strLength();
                helper = "@_WriteString(";
            }
            else if(pType->isBool())
            {
                auto valueIr = gen(pValue);
                code << valueIr->code;
                valueArgs << "i1 " << valueIr->value;
                helper = "@_WriteBool(";
            }
            else if(pType->isChar())
            {
                auto valueIr = gen(pValue);
                code << valueIr->code;
                valueArgs << "i8 " << valueIr->value;
                helper = "@_WriteChar(";
            }
            else if(pType->isOrdinal())
            {
                auto valueIr = gen(pValue);
                code << valueIr->code;
                valueArgs << "i32 " << valueIr->value;
                helper = "@_WriteInteger(";
            }
            else if(pType->isReal())
            {
                auto valueIr = gen(pValue);
                code << valueIr->code;
                valueArgs << "double " << valueIr->value;
                helper = "@_WriteReal(";
            }
            else
            {
                assert(!"unexpected write argument type");
            }

            code << TAB << "call void " << helper <<
                "i8* " << pFileHandleIr->value << ", " <<
                "i32 " << widthValue << ", " <<
                "i32 " << precisionValue << ", " <<
                valueArgs.str() << ")\n";
        }

        // writeln?
        //
        if (writeln)
        {
            code << TAB << "call void @_WriteLn(i8* " << pFileHandleIr->value << ")\n";
        }

        return { code.str(), "" };
    }

    IrFragment _expandTranscendental(const char* name, ast::ExprList* pArguments)
    {
        assert(nullptr != pArguments);
        assert(pArguments->size() == 1);

        stringstream code;
        // TODO
        return { code.str(), "" };
    }

    IrFragment _expandSqr(ast::ExprList* pArguments)
    {
        assert(nullptr != pArguments);
        assert(pArguments->size() == 1);

        stringstream code;
        // TODO
        return { code.str(), "" };
    }

    IrFragment _expandAbs(ast::ExprList* pArguments)
    {
        assert(nullptr != pArguments);
        assert(pArguments->size() == 1);

        stringstream code;
        // TODO
        return { code.str(), "" };
    }

    IrFragment _expandFileIntrinsic(obj::IntrinsicId intrinsicId, ast::ExprList* pArguments)
    {
        const static unordered_map<obj::IntrinsicId, string> fileIntrinsics = 
        {
            { obj::IN_EOF,      "bool [lpcRuntime]LPC.File::Eof()" },
            { obj::IN_EOLN,     "bool [lpcRuntime]LPC.File::Eoln()" },
            { obj::IN_REWRITE,  "void [lpcRuntime]LPC.File::Rewrite()" },
            { obj::IN_RESET,    "void [lpcRuntime]LPC.File::Reset()" },
            { obj::IN_PUT,      "void [lpcRuntime]LPC.File::Put()" },
            { obj::IN_GET,      "void [lpcRuntime]LPC.File::Get()" },
            { obj::IN_PAGE,     "void [lpcRuntime]LPC.File::Page()" },
        };

        assert(nullptr != pArguments);
        assert(pArguments->size() == 1);
        assert(pArguments->front()->pType->isFile());

        stringstream code;
        // TODO
        return { code.str(), "" };
    }

    // pack(a, start, z) intrinsic
    //
    // a        = src array
    // start    = src start index
    // z        = dst array
    //
    // the expansion is equivalent to:
    //
    //  for(i = <z base index>; i <= <z max index>; ++i)
    //  {
    //      z[i] = a[start++];
    //  }
    //
    // which results in the following IL:
    //
    //  ... TODO ...
    //
    IrFragment _expandPack(ast::ExprList* pArguments, int line)
    {
        assert(pArguments->size() == 3);

        stringstream code;
        // TODO
        return { code.str(), "" };
    }

    // unpack(z, a, start) intrinsic
    //
    // z        = src array
    // a        = dst array
    // start    = dst start index
    //
    // the expansion is equivalent to:
    //
    //  for(i = <z base index>; i <= <z max index>; ++i)
    //  {
    //      a[start++] = z[i];
    //  }
    //
    // which results in the following IL:
    //
    //  ... TODO ...
    //
    IrFragment _expandUnpack(ast::ExprList* pArguments, int line)
    {
        assert(pArguments->size() == 3);

        stringstream code;
        // TODO
        return { code.str(), "" };
    }

    IrFragment _expandOdd(ast::ExprList* pArguments)
    {
        assert(nullptr != pArguments);
        assert(pArguments->size() == 1);

        stringstream code;
        // TODO
        return { code.str(), "" };
    }

    IrFragment _expandHalt()
    {
        stringstream code;
        // TODO
        return { code.str(), "" };
    }

    IrFragment _expandIncDec(ast::ExprList* pArguments, bool inc)
    {
        assert(nullptr != pArguments);
        assert(pArguments->size() == 1);

        stringstream code;
        // TODO
        return { code.str(), "" };
    }

    IrFragment _expandTrivialCast(ast::ExprList* pArguments)
    {
        assert(nullptr != pArguments);
        assert(pArguments->size() == 1);

        stringstream code;
        code << gen(pArguments->front());
        return { code.str(), "" };
    }

    IrFragment _expandTrunc(const char* name, ast::ExprList* pArguments)
    {
        assert(nullptr != pArguments);
        assert(pArguments->size() == 1);

        stringstream code;
        // TODO
        return { code.str(), "" };
    }

    IrFragment _expandDispose(ast::ExprList* pArguments, int line)
    {
        assert(nullptr != pArguments);
        assert(pArguments->size() >= 1);

        stringstream code;
        // TODO
        return { code.str(), "" };
    }

    IrFragment _expandNew(ast::ExprList* pArguments, int line)
    {
        assert(nullptr != pArguments);
        assert(pArguments->size() >= 1);

        stringstream code;
        // TODO
        return { code.str(), "" };
    }

    IrFragment _expandIntrinsic(const ast::Intrinsic* pIntrinsic, ast::ExprList* pArguments)
    {
        switch(pIntrinsic->intrinsicId)
        {
        case obj::IN_READ:
            return _expandRead(pArguments, false);

        case obj::IN_READLN:
            return _expandRead(pArguments, true);

        case obj::IN_WRITE:
            return _expandWrite(pArguments, false);

        case obj::IN_WRITELN:
            return _expandWrite(pArguments, true);

        case obj::IN_NEW:
            return _expandNew(pArguments, pIntrinsic->line);

        case obj::IN_DISPOSE:
            return _expandDispose(pArguments, pIntrinsic->line);

        case obj::IN_ABS:
            return _expandAbs(pArguments);

        case obj::IN_SQR:
            return _expandSqr(pArguments);

        case obj::IN_SIN:
            return _expandTranscendental("Sin", pArguments);

        case obj::IN_COS:
            return _expandTranscendental("Cos", pArguments);

        case obj::IN_EXP:
            return _expandTranscendental("Exp", pArguments);

        case obj::IN_LN:
            return _expandTranscendental("Ln", pArguments);

        case obj::IN_SQRT:
            return _expandTranscendental("Sqrt", pArguments);

        case obj::IN_ARCTAN:
            return _expandTranscendental("Arctan", pArguments);

        case obj::IN_TRUNC:
            return _expandTrunc("Trunc", pArguments);

        case obj::IN_ROUND:
            return _expandTrunc("Round", pArguments);

        case obj::IN_ORD:
            return _expandTrivialCast(pArguments);

        case obj::IN_CHR:
            return _expandTrivialCast(pArguments);

        case obj::IN_SUCC:
            return _expandIncDec(pArguments, true);

        case obj::IN_PRED:
            return _expandIncDec(pArguments, false);

        case obj::IN_ODD:
            return _expandOdd(pArguments);

        case obj::IN_HALT:
            return _expandHalt();

        case obj::IN_PACK:
            return _expandPack(pArguments, pIntrinsic->line);

        case obj::IN_UNPACK:
            return _expandUnpack(pArguments, pIntrinsic->line);

        case obj::IN_EOF:
        case obj::IN_EOLN:
        case obj::IN_REWRITE:
        case obj::IN_RESET:
        case obj::IN_PUT:
        case obj::IN_GET:
        case obj::IN_PAGE:
            return _expandFileIntrinsic(pIntrinsic->intrinsicId, pArguments);

        default:
            assert(!"unexpected intrinsic id");
            return {};
        }
    }

    // generate the appropriate checks (if any) for
    // the source value on top of the stack, then it leaves
    // the original value on the stack
    //
    // CONSIDER: it should be trivial to do compile-time checks for constant values
    //
    string _genAssignmentChecks(ts::Type* pFromType, ts::Type* pToType)
    {
        stringstream code;

        // integral range checks?
        //
        if(pToType->isRange() || pToType->isEnum())
        {
            assert(pFromType->isOrdinal());

            if(pFromType->minValue() < pToType->minValue() ||
                pFromType->maxValue() > pToType->maxValue())
            {
                // TODO
            }
        }
        // set checks?
        //
        if(pToType->isSet())
        {
            assert(pFromType->isSet());

            if(pFromType->minValue() < pToType->minValue() ||
                pFromType->maxValue() > pToType->maxValue())
            {
                // TODO
            }
        }

        return code.str();
    }

    IrFragment _genFrameAddress(const Scope* pTargetScope);

    IrFragment _getStringAddress(ast::Expr* pString);

    IrFragment _genVarAddress(obj::Variable* pVar);

    IrFragment _genParamAddress(obj::Parameter* pParam);

    IrFragment _genLValueAddress(const ast::Expr* pLValue);

    string _initFrame(obj::Subroutine* pSubroutine);

    string _genInitializers(obj::Subroutine* pSubroutine);

    string _genCleanup(obj::Subroutine* pSubroutine);

    string _genEpilogue(obj::Subroutine* pSubroutine);

    // generate a subroutine (func/proc) call, either a direct call
    // or an indirect call through a subroutine pointer
    //
    IrFragment _genCall(ast::Expr* pCallee, ast::ExprList* pArguments, ts::Type* pReturnType)
    {
        // intrinsic function/procedure?
        //
        if(auto pIntrinsic = pCallee->as<ast::Intrinsic>())
        {
            return _expandIntrinsic(pIntrinsic, pArguments);
        }

        stringstream code;

        // slink / pfn
        //
        IrFragment slinkIr;
        string slinkType;
        string pfn;

        if(auto pFuncPtr = pCallee->as<ast::FuncPtr>())
        {
            // normal function call, generate the slink if needed
            //
            auto pSlinkScope = pFuncPtr->pFunc->pScope->pParent;
            if (pSlinkScope->level > Scope::PROGRAM_SCOPE_LEVEL)
            {
                slinkIr = _genFrameAddress(pSlinkScope);
                assert(!slinkIr.value.empty());
                code << slinkIr.code;
                slinkType = ext(pSlinkScope->subroutine())->frameName;
            }
            pfn = _genName(pFuncPtr->pFunc);
        }
        else
        {
            // calling through a function pointer passed as argument
            //
            // TODO
        }

        // actual arguments
        //
        vector<string> argumentValues;
        if (nullptr != pArguments)
        {
            auto pParamList = pCallee->pType->as<ts::SubroutineType>()->paramList();

            auto paramIt = pParamList->begin();
            auto argIt = pArguments->begin();

            // iterate the arguments/parameters lists in sync
            //
            for (; argIt != pArguments->end(); ++argIt, ++paramIt)
            {
                assert(paramIt != pParamList->end());

                auto pArgExpr = *argIt;

                stringstream argValue;

                if(paramIt->byRef)
                {
                    assert(pArgExpr->pType->isSameType(paramIt->pType));
                    const auto argPtrIr = _genLValueAddress(pArgExpr);
                    code << argPtrIr.code;
                    argValue << ext(pArgExpr->pType)->genName << "* " << argPtrIr.value;
                }
                else
                {
                    const auto argIr = gen(pArgExpr);
                    code << argIr->code;
                    argValue << ext(pArgExpr->pType)->genName << " " << argIr->value;
                }

                argumentValues.push_back(argValue.str());
            }

            assert(paramIt == pParamList->end());
        }

        // generate the call instruction
        //
        string retValue;
        if (pReturnType != nullptr)
        {
            retValue = _genTempValue();
            code << TAB << retValue << " = call " << ext(pReturnType)->genName << " ";
        }
        else
        {
            code << TAB << "call void ";
        }
        code << pfn << "(";

        bool firstArg = true;

        if (!slinkIr.value.empty())
        {
            assert(!slinkType.empty());
            code << slinkType << "* " << slinkIr.value;
            firstArg = false;
        }

        for (const auto& arg : argumentValues)
        {
            if (!firstArg)
                code << ", ";
            code << arg;
            firstArg = false;
        }

        code << ")\n";

        return { code.str(), retValue };
    }

    VarPtr visit(const ast::FuncCall* pFuncCall) override
    {
        auto callIr = _genCall(pFuncCall->pFunc, pFuncCall->pArguments, pFuncCall->pType);
        return newIrFragment(callIr.code, callIr.value);
    }

    VarPtr visit(const ast::Set* pSet) override
    {
        stringstream code;
        // TODO
        return newIrFragment(code.str(), "%.dummy.set");
    }

    // ast::WriteArgExpr should only appear as an argument to the write intrinsics
    //
    VarPtr visit(const ast::WriteArgExpr*) override
    {
        assert(!"not implemented");
        return VarPtr();
    }

    VarPtr visit(const ast::NopStm*) override
    {
        stringstream code;
        code << TAB << "; nop\n";
        return newIrFragment(code.str(), "");
    }

    VarPtr visit(const ast::CompoundStm* pCompoundStm) override
    {
        stringstream code;
        for (auto pStm : pCompoundStm->statements)
        {
            const auto pStmIr = gen(pStm);
            assert(pStmIr->value.empty());
            code << pStmIr->code;
        }
        return newIrFragment(code.str(), "");
    }

    VarPtr visit(const ast::IfStm* pIfStm) override
    {
        stringstream code;
        // TODO
        return newIrFragment(code.str(), "");
    }

    VarPtr visit(const ast::CaseStm* pCaseStm) override
    {
        stringstream code;
        // TODO
        return newIrFragment(code.str(), "");
    }

    VarPtr visit(const ast::AssignStm* pAssignStm) override
    {
        auto pType = pAssignStm->pLValue->pType;
        assert(!pType->isFile());

        const auto irType = ext(pType)->genName;

        const auto lvaluePtr = _genLValueAddress(pAssignStm->pLValue);
        const auto rvalueIr = gen(pAssignStm->pRValue);

        // TODO: handle file indirections

        stringstream code;

        code << lvaluePtr.code;
        code << rvalueIr->code;
        code << TAB << "store " << irType << " " << rvalueIr->value << ", " <<
            irType << "* " << lvaluePtr.value << "\n";

        return newIrFragment(code.str(), "");
    }

    VarPtr visit(const ast::WhileStm* pWhileStm) override
    {
        stringstream code;
        // TODO
        return newIrFragment(code.str(), "");
    }

    VarPtr visit(const ast::RepeatStm* pRepeatStm) override
    {
        stringstream code;
        // TODO
        return newIrFragment(code.str(), "");
    }

    VarPtr visit(const ast::ForStm* pForStm) override
    {
        stringstream code;
        // TODO
        return newIrFragment(code.str(), "");
    }

    // for local GOTOs:
    //
    //      ... TODO ...
    //
    // non-local GOTOs:
    //
    //      ... TODO ...
    //
    VarPtr visit(const ast::GotoStm* pGotoStm) override
    {
        std::stringstream code;
        
        if(pGotoStm->isNonLocal)
        {
            assert(pGotoStm->pTargetLabel->isNonLocalTarget());
            // TODO
        }
        else
        {
            const auto pExt = ext(pGotoStm->pTargetLabel);
            assert(!pExt->genName.empty());
            // TODO
        }

        return newIrFragment(code.str(), "");
    }

    VarPtr visit(const ast::ProcCallStm* pProcCallStm) override
    {
        auto callIr = _genCall(pProcCallStm->pProc, pProcCallStm->pArguments, nullptr);
        assert(callIr.value.empty());
        return newIrFragment(callIr.code, callIr.value);
    }
};

} // end namespace llvm

