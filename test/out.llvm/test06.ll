; ModuleID = 'test06.pas'
source_filename = "C:\Users\lemo\work\compilers\lpc\test\test06.pas"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"


; line 0
;================================================================================
; scope: global scope (level : 0)

; types
%T_text = type i8*

; line 4
;================================================================================
; scope: program scope (level : 1)

; program variables
@_input = dso_local global %T_text zeroinitializer
@_output = dso_local global %T_text zeroinitializer
@i = dso_local global i32 zeroinitializer
@p = dso_local global i8* zeroinitializer

; line 11
;================================================================================
; scope: init (level : 2)

; activation record
%Frame_init = type
{
    ; parameters
    i8*,    ; pointer

    ; dummy
    i8*
};

; line 16
;================================================================================
; scope: setValue (level : 2)

; activation record
%Frame_setValue = type
{
    ; parameters
    i8*,    ; pointer
    i32,    ; value

    ; dummy
    i8*
};

; line 22
;================================================================================
; scope: free (level : 2)

; activation record
%Frame_free = type
{
    ; parameters
    i8*,    ; pointer

    ; dummy
    i8*
};

;================================================================================
; metadata

!llvm.dbg.cu = !{!13}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!12}

!0 = !DIFile(filename: "test06.pas", directory: "C:\Users\lemo\work\compilers\lpc\test")
!1 = !DIBasicType(name: "boolean", size: 8, encoding: DW_ATE_boolean)
!2 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!3 = !DIBasicType(name: "integer", size: 32, encoding: DW_ATE_signed)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, file: !0, line: 0, baseType: !5, size: 64)
!5 = !DIBasicType(name: "void", size: 0)
!6 = !DIBasicType(name: "real", size: 64, encoding: DW_ATE_float)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "text", file: !0, line: 0, baseType: null, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "ptr", file: !0, line: 6, baseType: !3, size: 64)
!9 = !{!1,!2,!3,!4,!5,!6,!7,!8}
!10 = !{}
!11 = !{}
!12 = !{!"LPC 1.1"}
!13 = distinct !DICompileUnit(language: DW_LANG_Pascal83, file: !0, producer: "LPC 1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !10, retainedTypes: !9, globals: !11, nameTableKind: None)
!14 = !{i32 2, !"CodeView", i32 1}
!15 = !{i32 2, !"Debug Info Version", i32 3}

