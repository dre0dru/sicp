#lang sicp
(define (square x) (* x x))

(define (sqrt-iter guess x)
(if (good-enough? guess x)
guess
(sqrt-iter (improve guess x) x)))

(define (new-sqrt-iter guess x)
(if (new-good-enough? guess x)
guess
(new-sqrt-iter (improve guess x) x)))

(define (improve guess x)
(average guess (/ x guess)))

(define (average x y)
(/ (+ x y) 2))

(define (good-enough? guess x)
(< (abs (- (square guess) x)) 0.001))

(define (new-good-enough? guess x) 
(< (abs (- (improve guess x) guess)) (* guess 0.00001)))
; improving guess until difference between old and new guess is smaller than some fraction of initial guess
; using fraction eliminates the problem with very large values (since they are very unprecise)
; ane for small values fraction of them is good enough, because they are indeed very precise

(define (sqrt x)
(sqrt-iter 1.0 x))

(define (new-sqrt x)
(new-sqrt-iter 1.0 x))

(new-sqrt 9)
(sqrt 9)

(new-sqrt 0.0000001)
(sqrt 0.0000001) ;=~ 0.03125, but 0.03125^2 =~ 0.000976 which is far enough from 0.0000001
; value of 0.001 is too big to compute difference between very small values

(new-sqrt 10000000000000)
(sqrt 10000000000000) ; but for large values 0.001 is too small, because floating point precision cannot
; represent such small difference between large values. that means that improving guess cannot yield new value that has
; 0.001 difference from old value
; the result is infinite recursion


