#lang sicp
(#%require "math.rkt")
(#%require "list.rkt")

(define (square-tree items)
  (cond ((null? items) nil)
        ((not (pair? items)) (square items))
        (else (cons (square-tree (car items)) (square-tree (cdr items))))
        )
  )

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

(define (square-tree* items)
  (map (lambda (x)
         (if (pair? x)
             (square-tree* x)
             (square x)
             )
         )
       items)
  )

(square-tree*
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))