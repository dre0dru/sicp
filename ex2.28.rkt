#lang sicp
(#%require "list.rkt")

(define (fringe items)
  (define (iter items result)
    (cond ((null? items) result)
          ((pair? items) (iter (car items) (iter (cdr items) result)))
          (else (cons items result))
          )
    )
  (iter items (list))
  )


(define x (list (list 1 2) (list 3 4)))
x

(fringe x)
