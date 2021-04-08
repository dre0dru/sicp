#lang sicp

(define (fast-expt b n)
  (define (square x) (* x x))
  (define (func-iter n b a) 
    (cond ((= 0 n) a) 
          ((even? n) (func-iter (/ n 2) (square b) a)) 
          (else (func-iter (- n 1) b (* b a))))) 
  (func-iter n b 1))

(fast-expt 3 4)
(fast-expt 3 5)