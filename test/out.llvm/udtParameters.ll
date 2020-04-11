; ModuleID = 'udtParameters.pas'
source_filename = "C:\Users\lemo\work\compilers\lpc\test\udtParameters.pas"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"

; runtime functions
declare dso_local i8* @_OpenFile(i32)
declare dso_local i8* @_OpenTempFile(i8*)
declare dso_local void @_CloseFile(i8*)

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
%T_A = type [10 x i32]
%T_R = type [24 x i8]
%T_S = type [1 x i32]

; program variables
@_input = dso_local global %T_text zeroinitializer
@_output = dso_local global %T_text zeroinitializer
@i = dso_local global i32 zeroinitializer
@vA = dso_local global %T_A zeroinitializer
@vR = dso_local global %T_R zeroinitializer

; procedure body
define void @P_()
{
    %t1 = call i8* @_OpenFile(i32 0)
    store i8* %t1, i8** @_input
    %t2 = call i8* @_OpenFile(i32 1)
    store i8* %t2, i8** @_output
    %t3 = load %T_text, %T_text* @_output
    call void @_CloseFile(i8* %t3)
    %t4 = load %T_text, %T_text* @_input
    call void @_CloseFile(i8* %t4)
    ret void
}


; line 19
;================================================================================
; scope: fooA (level : 2)

; activation record
%Frame_fooA = type
{
    ; parameters
    %T_A,    ; 0: arg

    ; variables
    i32,    ; 1: i

    ; dummy
    i8*
};

; procedure body
define void @P_fooA()
{
    %frame = alloca %Frame_fooA, align 8
    ret void
}


; line 27
;================================================================================
; scope: fooS (level : 2)

; activation record
%Frame_fooS = type
{
    ; parameters
    %T_S,    ; 0: arg

    ; variables
    i32,    ; 1: i

    ; dummy
    i8*
};

; procedure body
define void @P_fooS()
{
    %frame = alloca %Frame_fooS, align 8
    ret void
}


; line 38
;================================================================================
; scope: fooR (level : 2)

; activation record
%Frame_fooR = type
{
    ; parameters
    %T_R,    ; 0: arg

    ; dummy
    i8*
};

; procedure body
define void @P_fooR()
{
    %frame = alloca %Frame_fooR, align 8
    ret void
}


;================================================================================
; string literals

@.str.1 = private unnamed_addr constant [7 x i8] c"_input\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"_output\00", align 1


;================================================================================
; metadata

!llvm.dbg.cu = !{!25}
!llvm.module.flags = !{!26, !27}
!llvm.ident = !{!24}

!0 = !DIFile(filename: "udtParameters.pas", directory: "C:\Users\lemo\work\compilers\lpc\test")
!1 = !DIBasicType(name: "boolean", size: 8, encoding: DW_ATE_boolean)
!2 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!3 = !DIBasicType(name: "integer", size: 32, encoding: DW_ATE_signed)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, file: !0, line: 0, baseType: !5, size: 64)
!5 = !DIBasicType(name: "void", size: 0)
!6 = !DIBasicType(name: "real", size: 64, encoding: DW_ATE_float)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "text", file: !0, line: 0, baseType: null, size: 64)
!8 = !DICompositeType(tag: DW_TAG_array_type, name: "A", file: !0, line: 5, baseType: !3, size: 320, elements: !10)
!9 = !DISubrange(count: 10)
!10 = !{!9}
!11 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "R", file: !0, line: 9, size: 192, flags: DIFlagTypePassByValue, elements: !16)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !11, file: !0, line: 10, baseType: !3, size: 32, offset: 0)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !11, file: !0, line: 10, baseType: !3, size: 32, offset: 32)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !11, file: !0, line: 11, baseType: !6, size: 64, offset: 64)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "d", scope: !11, file: !0, line: 11, baseType: !6, size: 64, offset: 128)
!16 = !{!12,!13,!14,!15}
!17 = !DICompositeType(tag: DW_TAG_array_type, name: "S", file: !0, line: 7, baseType: !20, size: 32, elements: !19)
!18 = !DISubrange(count: 11)
!19 = !{!18}
!20 = !DIBasicType(size: 1, encoding: DW_ATE_boolean)
!21 = !{!1,!2,!3,!4,!5,!6,!7,!8,!11,!17}
!22 = !{}
!23 = !{}
!24 = !{!"LPC 1.1"}
!25 = distinct !DICompileUnit(language: DW_LANG_Pascal83, file: !0, producer: "LPC 1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !22, retainedTypes: !21, globals: !23, nameTableKind: None)
!26 = !{i32 2, !"CodeView", i32 1}
!27 = !{i32 2, !"Debug Info Version", i32 3}

