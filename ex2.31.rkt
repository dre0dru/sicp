#lang sicp
(#%require "math.rkt")
(#%require "list.rkt")

(define (tree-map proc items)
  (map (lambda (x)
         (if (pair? x)
             (tree-map proc x)
             (proc x)
          )
        )
       items)
  )

(define (square-tree tree) (tree-map square tree))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))