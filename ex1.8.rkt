#lang sicp
(define (square x) (* x x))

(define (cube x) (* x x x))

(define (cubert-iter guess x)
(if (good-enough? guess x)
guess
(cubert-iter (improve guess x) x)))

(define (improve guess x)
(approx x guess))

; y is an approximation = guess
(define (approx x y)
(/ (+ (/ x (square y)) (* 2 y))
   3))

; since we are dealing with possible negative values must be used absolute values of guess fraction
(define (good-enough? guess x)
(< (abs (- (improve guess x) guess)) (abs (* guess 0.00001))))

(define (cubert x)
(cubert-iter 1.1 x))

(cubert 27)
(cubert 0.000027)
(cubert 10000000000000)
(cubert 0.0000001)
(cubert -27)

; alternative check for good enough
; uses limits of system floating point precision
; so it produces new values until they are equal
; (define (good-enough? guess x) 
;   (= (improve guess x) guess)) 