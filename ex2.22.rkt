#lang sicp
(#%require "math.rkt")

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))
; cons [current list] [answer] leads to reversed order

(square-list (list 1 2 3 4))

(define (square-list* items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))
; can't append new value to the end of the list, it creates new pair of "nested" lists

(square-list* (list 1 2 3 4))