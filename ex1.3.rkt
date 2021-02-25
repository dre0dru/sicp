#lang sicp
(define (f a b c)
  (define (square a)
    (* a a))
  (define (square-sum a b)
    (+ (square a) (square b)))
  (define (square-sum-largest a b c)
    (cond ((and (>= a c) (>= b c)) (square-sum a b))
          ((and (>= b a) (>= c a)) (square-sum b c))
          ((and (>= a b) (>= c b)) (square-sum a c))))
  (square-sum-largest a b c))

(f 2 3 4)