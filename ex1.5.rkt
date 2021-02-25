#lang sicp
(define (p) (p))

(define (test x y)
(if (= x 0) 0 y))

(test 0 (p))

; applicative-order: infinite recursion.
; p calls p until manually stopped
; normal-order: evaluate (= x 0) to true, return 0
; p is never evaluated/called