#lang sicp
(#%require "math.rkt")

(define (cons x y)
  (* (exp 2 x) (exp 3 y))
  )

(define (div-count pair div)
  (define (iter pair div count)
    (if (= (remainder pair div) 0) 
        (iter (/ pair div) div (inc count)) 
        count)
    )
  (iter pair div 0)
  )

(define (car pair)
  (div-count pair 2)
  )

(define (cdr pair)
  (div-count pair 3)
  )

(car (cons 2 3))
(cdr (cons 4 5))