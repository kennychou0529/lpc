; ModuleID = 'allvar.pas'
source_filename = "C:\Users\lemo\work\compilers\lpc\test\allvar.pas"
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

; program variables
@_input = dso_local global %T_text zeroinitializer
@_output = dso_local global %T_text zeroinitializer
@A = dso_local global i32 zeroinitializer
@AnimalCookies = dso_local global i8 zeroinitializer
@B = dso_local global i32 zeroinitializer
@C = dso_local global i32 zeroinitializer
@D = dso_local global i32 zeroinitializer
@DogTail = dso_local global double zeroinitializer
@Puppy = dso_local global i1 zeroinitializer

; procedure body
define void @P_()
{
    ; initialize file handles
    %t1 = call i8* @_OpenFile(i32 0)
    store i8* %t1, i8** @_input
    %t2 = call i8* @_OpenFile(i32 1)
    store i8* %t2, i8** @_output

    ; body
    store i32 4, i32* @A
    store i32 5, i32* @B
    store i32 212, i32* @C
    %t4 = load i32, i32* @C
    %t3 = add i32 %t4, 3
    store i32 %t3, i32* @D
    store double 345.125, double* @DogTail
    %t6 = load i32, i32* @B
    %t7 = load i32, i32* @A
    %t5 = icmp sgt i32 %t6, %t7
    store i1 %t5, i1* @Puppy
    store i8 82, i8* @AnimalCookies
    %t8 = load %T_text, %T_text* @_output
    call void @_WriteString(i8* %t8, i32 0, i32 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i32 0, i32 0), i32 16)
    %t9 = load i32, i32* @A
    call void @_WriteInteger(i8* %t8, i32 5, i32 0, i32 %t9)
    %t10 = load i32, i32* @B
    call void @_WriteInteger(i8* %t8, i32 5, i32 0, i32 %t10)
    call void @_WriteLn(i8* %t8)
    %t11 = load %T_text, %T_text* @_output
    call void @_WriteString(i8* %t11, i32 0, i32 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i32 0, i32 0), i32 13)
    %t12 = load i32, i32* @C
    call void @_WriteInteger(i8* %t11, i32 5, i32 0, i32 %t12)
    %t13 = load i32, i32* @D
    call void @_WriteInteger(i8* %t11, i32 5, i32 0, i32 %t13)
    call void @_WriteLn(i8* %t11)
    %t14 = load %T_text, %T_text* @_output
    call void @_WriteString(i8* %t14, i32 0, i32 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5, i32 0, i32 0), i32 17)
    %t15 = load double, double* @DogTail
    call void @_WriteReal(i8* %t14, i32 12, i32 2, double %t15)
    %t16 = load double, double* @DogTail
    call void @_WriteReal(i8* %t14, i32 12, i32 4, double %t16)
    call void @_WriteLn(i8* %t14)
    %t17 = load %T_text, %T_text* @_output
    call void @_WriteLn(i8* %t17)
    %t18 = load %T_text, %T_text* @_output
    call void @_WriteString(i8* %t18, i32 0, i32 0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.6, i32 0, i32 0), i32 21)
    %t19 = load i1, i1* @Puppy
    call void @_WriteBool(i8* %t18, i32 0, i32 0, i1 %t19)
    %t20 = load i1, i1* @Puppy
    call void @_WriteBool(i8* %t18, i32 13, i32 0, i1 %t20)
    call void @_WriteLn(i8* %t18)
    %t21 = load %T_text, %T_text* @_output
    call void @_WriteString(i8* %t21, i32 0, i32 0, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.7, i32 0, i32 0), i32 24)
    %t22 = load i8, i8* @AnimalCookies
    call void @_WriteChar(i8* %t21, i32 0, i32 0, i8 %t22)
    call void @_WriteLn(i8* %t21)
    ; nop

    ; cleanup
    %t23 = load %T_text, %T_text* @_output
    call void @_CloseFile(i8* %t23)
    %t24 = load %T_text, %T_text* @_input
    call void @_CloseFile(i8* %t24)

    ; epilogue
    ret void
}


;================================================================================
; string literals

@.str.6 = private unnamed_addr constant [22 x i8] c"The boolean value is \00", align 1
@.str.4 = private unnamed_addr constant [14 x i8] c"The bytes are\00", align 1
@.str.7 = private unnamed_addr constant [25 x i8] c"The char variable is an \00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"The integers are\00", align 1
@.str.5 = private unnamed_addr constant [18 x i8] c"The real value is\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"_input\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"_output\00", align 1


;================================================================================
; metadata

!llvm.dbg.cu = !{!13}
!llvm.module.flags = !{!14, !15}
!llvm.ident = !{!12}

!0 = !DIFile(filename: "allvar.pas", directory: "C:\Users\lemo\work\compilers\lpc\test")
!1 = !DIBasicType(name: "boolean", size: 8, encoding: DW_ATE_boolean)
!2 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!3 = !DIBasicType(name: "integer", size: 32, encoding: DW_ATE_signed)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, file: !0, line: 0, baseType: !5, size: 64)
!5 = !DIBasicType(name: "void", size: 0)
!6 = !DIBasicType(name: "real", size: 64, encoding: DW_ATE_float)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "text", file: !0, line: 0, baseType: null, size: 64)
!8 = !DIBasicType(name: "range", size: 32, encoding: DW_ATE_signed)
!9 = !{!1,!2,!3,!4,!5,!6,!7,!8}
!10 = !{}
!11 = !{}
!12 = !{!"LPC 1.1"}
!13 = distinct !DICompileUnit(language: DW_LANG_Pascal83, file: !0, producer: "LPC 1.1", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !10, retainedTypes: !9, globals: !11, nameTableKind: None)
!14 = !{i32 2, !"CodeView", i32 1}
!15 = !{i32 2, !"Debug Info Version", i32 3}

