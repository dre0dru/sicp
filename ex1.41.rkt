#lang sicp

(define (double f) 
  (lambda (x) (f (f x))))

(
 ((double (double double))
  inc)
 5
 )

; inc^2(inc^2(inc^2))) -> +16
; inc^2(inc^2(+2)))
; inc^2(+2 +2 +2 +2)
; (+2 +2 +2 +2 +2 +2 +2 +2 +2) -> +16

