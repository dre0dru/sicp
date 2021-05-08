#lang sicp
(#%require "list.rkt")

(define (reverse items)
  (if (null? items)
      nil
      (append (reverse (cdr items)) (list (car items)))
      )
  )


(reverse (list 1 4 9 16 25))

