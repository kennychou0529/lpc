
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
; scope: foo_bar1 (level : 3)

; line 19
;================================================================================
; scope: foo_bar2 (level : 3)

; line 22
;================================================================================
; scope: foo_bar2_moo (level : 4)