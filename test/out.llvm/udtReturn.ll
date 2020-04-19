; ModuleID = 'udtReturn.pas'
source_filename = "C:\Users\lemo\work\compilers\lpc\test\udtReturn.pas"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"

; runtime functions
declare dso_local i8* @_OpenFile(i32)
declare dso_local i8* @_OpenTempFile(i8*)
declare dso_local void @_CloseFile(i8*)
declare dso_local void @_WriteBool(i8*, i32, i32, i1)
declare dso_local void @_WriteChar(i8*, i32, i32, i8)
declare dso_local void @_WriteInteger(i8*, i32, i32, i32)
declare dso_local void @_WriteReal(i8*, i32, i32, double)
declare dso_local void @_WriteString(i8*, i32, i32, i8*, i32)
declare dso_local void @_WriteLn(i8*)

; program arguments (command line mapping)
%struct._Filename = type { i8*, i8* }
@_FilenameMapEntries = internal global [3 x %struct._Filename]
    [
    %struct._Filename { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0), i8* null },
    %struct._Filename { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i32 0, i32 0), i8* null },
    %struct._Filename { i8* null, i8* null }
    ], align 16
@_FilenameMap = dso_local global %struct._Filename* getelementptr inbounds ([3 x %struct._Filename], [3 x %struct._Filename]* @_FilenameMapEntries, i32 0, i32 0), align 8
@_FilenameMapSize = dso_local constant i32 2, align 4

; line 0
;================================================================================
; scope: global scope (level : 0)

; types
%T_text = type i8*

; line 2
;================================================================================
; scope: program scope (level : 1)

; types
%T_A = type [4 x i32]
%T_R = type [8 x i8]
%T_S = type [1 x i32]

; program variables
@_input = dso_local global %T_text zeroinitializer
@_output = dso_local global %T_text zeroinitializer
@i = dso_local global i32 zeroinitializer
@vA = dso_local global %T_A zeroinitializer
@vR = dso_local global %T_R zeroinitializer
@vS = dso_local global %T_S zeroinitializer

; procedure body
define void @P_()
{
    ; initialize file handles
    %t1 = call i8* @_OpenFile(i32 0)
    store i8* %t1, i8** @_input
    %t2 = call i8* @_OpenFile(i32 1)
    store i8* %t2, i8** @_output

    ; body
    %t3 = call %T_A @F_fooA()
    store %T_A %t3, %T_A* @vA
    %t4 = call %T_S @F_fooS()
    store %T_S %t4, %T_S* @vS
    %t5 = call %T_R @F_fooR()
    store %T_R %t5, %T_R* @vR
    %t6 = load %T_text, %T_text* @_output
    call void @_WriteLn(i8* %t6)
    %t7 = load %T_text, %T_text* @_output
    call void @_WriteString(i8* %t7, i32 0, i32 0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i32 0, i32 0), i32 6)
    %t8 = load %T_text, %T_text* @_output
    call void @_WriteChar(i8* %t8, i32 0, i32 0, i8 93)
    call void @_WriteLn(i8* %t8)
    %t9 = load %T_text, %T_text* @_output
    call void @_WriteLn(i8* %t9)
    %t10 = load %T_text, %T_text* @_output
    call void @_WriteString(i8* %t10, i32 0, i32 0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.4, i32 0, i32 0), i32 6)
    %t12 = getelementptr inbounds %T_R, %T_R* @vR, i32 0, i32 0
    %t11 = bitcast i8* %t12 to i32*
    %t13 = load i32, i32* %t11
    call void @_WriteInteger(i8* %t10, i32 0, i32 0, i32 %t13)
    call void @_WriteString(i8* %t10, i32 0, i32 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0), i32 8)
    %t15 = getelementptr inbounds %T_R, %T_R* @vR, i32 0, i32 4
    %t14 = bitcast i8* %t15 to i32*
    %t16 = load i32, i32* %t14
    call void @_WriteInteger(i8* %t10, i32 0, i32 0, i32 %t16)
    call void @_WriteLn(i8* %t10)
    ; nop

    ; cleanup
    %t17 = load %T_text, %T_text* @_output
    call void @_CloseFile(i8* %t17)
    %t18 = load %T_text, %T_text* @_input
    call void @_CloseFile(i8* %t18)

    ; epilogue
    ret void
}


; line 19
;================================================================================
; scope: fooA (level : 2)

; activation record
%Frame_fooA = type
{
    ; variables
    %T_A,    ; 0: _fnvalue
    %T_A,    ; 1: tmp

    ; dummy
    i8*
};

; function body
define %T_A @F_fooA()
{
    ; allocate frame
    %.frame = alloca %Frame_fooA, align 8

    ; body
    %t1 = getelementptr inbounds %Frame_fooA, %Frame_fooA* %.frame, i32 0, i32 1
    %t2 = getelementptr inbounds %T_A, %T_A* %t1, i32 0, i32 0
    store i32 0, i32* %t2
    %t3 = getelementptr inbounds %Frame_fooA, %Frame_fooA* %.frame, i32 0, i32 1
    %t4 = getelementptr inbounds %T_A, %T_A* %t3, i32 0, i32 1
    store i32 1, i32* %t4
    %t5 = getelementptr inbounds %Frame_fooA, %Frame_fooA* %.frame, i32 0, i32 1
    %t6 = getelementptr inbounds %T_A, %T_A* %t5, i32 0, i32 2
    store i32 2, i32* %t6
    %t7 = getelementptr inbounds %Frame_fooA, %Frame_fooA* %.frame, i32 0, i32 1
    %t8 = getelementptr inbounds %T_A, %T_A* %t7, i32 0, i32 3
    store i32 3, i32* %t8
    %t9 = getelementptr inbounds %Frame_fooA, %Frame_fooA* %.frame, i32 0, i32 0
    %t11 = getelementptr inbounds %Frame_fooA, %Frame_fooA* %.frame, i32 0, i32 1
    %t10 = load %T_A, %T_A* %t11
    store %T_A %t10, %T_A* %t9
    ; nop

    ; epilogue
    %t12 = getelementptr inbounds %Frame_fooA, %Frame_fooA* %.frame, i32 0, i32 0
    %t13 = load %T_A, %T_A* %t12
    ret %T_A %t13
}


; line 29
;================================================================================
; scope: fooS (level : 2)

; activation record
%Frame_fooS = type
{
    ; variables
    %T_S,    ; 0: _fnvalue

    ; dummy
    i8*
};

; function body
define %T_S @F_fooS()
{
    ; allocate frame
    %.frame = alloca %Frame_fooS, align 8

    ; body
    %t1 = getelementptr inbounds %Frame_fooS, %Frame_fooS* %.frame, i32 0, i32 0
    store %T_S %.dummy_set, %T_S* %t1
    ; nop

    ; epilogue
    %t2 = getelementptr inbounds %Frame_fooS, %Frame_fooS* %.frame, i32 0, i32 0
    %t3 = load %T_S, %T_S* %t2
    ret %T_S %t3
}


; line 34
;================================================================================
; scope: fooR (level : 2)

; activation record
%Frame_fooR = type
{
    ; variables
    %T_R,    ; 0: _fnvalue
    %T_R,    ; 1: tmp

    ; dummy
    i8*
};

; function body
define %T_R @F_fooR()
{
    ; allocate frame
    %.frame = alloca %Frame_fooR, align 8

    ; body
    %t1 = getelementptr inbounds %Frame_fooR, %Frame_fooR* %.frame, i32 0, i32 1
    %t3 = getelementptr inbounds %T_R, %T_R* %t1, i32 0, i32 0
    %t2 = bitcast i8* %t3 to i32*
    store i32 11, i32* %t2
    %t4 = getelementptr inbounds %Frame_fooR, %Frame_fooR* %.frame, i32 0, i32 1
    %t6 = getelementptr inbounds %T_R, %T_R* %t4, i32 0, i32 4
    %t5 = bitcast i8* %t6 to i32*
    store i32 22, i32* %t5
    %t7 = getelementptr inbounds %Frame_fooR, %Frame_fooR* %.frame, i32 0, i32 0
    %t9 = getelementptr inbounds %Frame_fooR, %Frame_fooR* %.frame, i32 0, i32 1
    %t8 = load %T_R, %T_R* %t9
    store %T_R %t8, %T_R* %t7
    ; nop

    ; epilogue
    %t10 = getelementptr inbounds %Frame_fooR, %Frame_fooR* %.frame, i32 0, i32 0
    %t11 = load %T_R, %T_R* %t10
    ret %T_R %t11
}


;================================================================================
; string literals

@.str.5 = private unnamed_addr constant [9 x i8] c", r.b = \00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"_input\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"_output\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"r.a = \00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"s = [ \00", align 1


;================================================================================
; metadata

!llvm.dbg.cu = !{!23}
!llvm.module.flags = !{!24, !25}
!llvm.ident = !{!22}

!0 = !DIFile(filename: "udtReturn.pas", directory: "C:\Users\lemo\work\compilers\lpc\test")
!1 = !DIBasicType(name: "boolean", size: 8, encoding: DW_ATE_boolean)
!2 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!3 = !DIBasicType(name: "integer", size: 32, encoding: DW_ATE_signed)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, file: !0, line: 0, baseType: !5, size: 64)
!5 = !DIBasicType(name: "void", size: 0)
!6 = !DIBasicType(name: "real", size: 64, encoding: DW_ATE_float)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "text", file: !0, line: 0, baseType: null, size: 64)
!8 = !DICompositeType(tag: DW_TAG_array_type, name: "A", file: !0, line: 5, baseType: !3, size: 128, elements: !10)
!9 = !DISubrange(count: 4)
!10 = !{!9}
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "R", file: !0, line: 9, size: 64, flags: DIFlagTypePassByValue, elements: !14)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !11, file: !0, line: 10, baseType: !3, size: 32, offset: 0)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !11, file: !0, line: 10, baseType: !3, size: 32, offset: 32)
!14 = !{!12,!13}
!15 = !DICompositeType(tag: DW_TAG_array_type, name: "S", file: !0, line: 7, baseType: !18, size: 32, elements: !17)
!16 = !DISubrange(count: 11)
!17 = !{!16}
!18 = !DIBasicType(size: 1, encoding: DW_ATE_boolean)
!19 = !{!1,!2,!3,!4,!5,!6,!7,!8,!11,!15}
!20 = !{}
!21 = !{}
!22 = !{!"LPC 1.1"}
!23 = distinct !DICompileUnit(language: DW_LANG_Pascal83, file: !0, producer: "LPC 1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !20, retainedTypes: !19, globals: !21, nameTableKind: None)
!24 = !{i32 2, !"CodeView", i32 1}
!25 = !{i32 2, !"Debug Info Version", i32 3}

