
; line 0
;================================================================================
; scope: global scope (level : 0)

; types
%T_pointer_1 = type i8*
%T_text = type __file

; line 4
;================================================================================
; scope: program scope (level : 1)

; program variables
@_input = dso_local global %T_text zeroinitializer
@_output = dso_local global %T_text zeroinitializer
@v = dso_local global i32 zeroinitializer

; line 8
;================================================================================
; scope: foo (level : 2)

; line 11
;================================================================================
; scope: foo_testPfn (level : 3)

; line 17
;================================================================================
; scope: foo_bar1 (level : 3)

; types
%T_foo_bar1_subroutine_2 = type __subroutine

; line 29
;================================================================================
; scope: foo_bar2 (level : 3)

; types
%T_foo_bar2_subroutine_3 = type __subroutine

; line 32
;================================================================================
; scope: foo_bar2_moo (level : 4)

; types
%T_foo_bar2_moo_subroutine_4 = type __subroutine

; line 44
;================================================================================
; scope: foo_bar2_testPfn (level : 4)

; line 59
;================================================================================
; scope: foo_procPfn (level : 3)