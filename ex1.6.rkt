#lang sicp
(define (new-if predicate then-clause else-clause)
(cond (predicate then-clause)
(else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

(define (square x) (* x x))

(define (sqrt-iter guess x)
(new-if (good-enough? guess x)
guess
(sqrt-iter (improve guess x) x)))

(define (improve guess x)
(average guess (/ x guess)))

(define (average x y)
(/ (+ x y) 2))

(define (good-enough? guess x)
(< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
(sqrt-iter 1.0 x))

(sqrt 9)

; interpreter uses applicative-order execution
; but default if statement only evaluates either consequent or alternative depending on the predicate value because it is a special form
; redefined if statemend (new-if) uses applicative-order execution
; that means that it has to evaluate both consequent and alternative expressions before proceeding
; the result is infinite recursion