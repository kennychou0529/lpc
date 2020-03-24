; ModuleID = 'nonlocalGoto.pas'
source_filename = "C:\Users\lemo\work\compilers\lpc\test\nonlocalGoto.pas"
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
@p1 = dso_local global i32 zeroinitializer
@p2 = dso_local global i32 zeroinitializer

; procedure body
define void @P_()
{
    ret void
}

; line 12
;================================================================================
; scope: foo (level : 2)

; activation record
%Frame_foo = type
{
    ; parameters
    i32,    ; 0: x

    ; variables
    i32,    ; 1: _fnvalue

    ; dummy
    i8*
};

; function body
define i32 @F_foo()
{
    %1 = alloca %Frame_foo, align 8
    %2 = getelementptr inbounds %Frame_foo, %Frame_foo* %1, i32 0, i32 1
    %3 = load i32, i32* %2
    ret i32 %3
}

; line 23
;================================================================================
; scope: bar (level : 2)

; activation record
%Frame_bar = type
{
    ; parameters
    i32,    ; 0: x

    ; dummy
    i8*
};

; procedure body
define void @P_bar()
{
    %1 = alloca %Frame_bar, align 8
    ret void
}

; line 27
;================================================================================
; scope: bar_moo (level : 3)

; activation record
%Frame_bar_moo = type
{
    ; slink
    %Frame_bar*    ; 0
};

; procedure body
define void @P_bar_moo()
{
    %1 = alloca %Frame_bar_moo, align 8
    ret void
}

;================================================================================
; metadata

!llvm.dbg.cu = !{!12}
!llvm.module.flags = !{!13, !14}
!llvm.ident = !{!11}

!0 = !DIFile(filename: "nonlocalGoto.pas", directory: "C:\Users\lemo\work\compilers\lpc\test")
!1 = !DIBasicType(name: "boolean", size: 8, encoding: DW_ATE_boolean)
!2 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!3 = !DIBasicType(name: "integer", size: 32, encoding: DW_ATE_signed)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, file: !0, line: 0, baseType: !5, size: 64)
!5 = !DIBasicType(name: "void", size: 0)
!6 = !DIBasicType(name: "real", size: 64, encoding: DW_ATE_float)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "text", file: !0, line: 0, baseType: null, size: 64)
!8 = !{!1,!2,!3,!4,!5,!6,!7}
!9 = !{}
!10 = !{}
!11 = !{!"LPC 1.1"}
!12 = distinct !DICompileUnit(language: DW_LANG_Pascal83, file: !0, producer: "LPC 1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, retainedTypes: !8, globals: !10, nameTableKind: None)
!13 = !{i32 2, !"CodeView", i32 1}
!14 = !{i32 2, !"Debug Info Version", i32 3}

