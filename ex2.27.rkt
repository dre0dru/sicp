#lang sicp
(#%require "list.rkt")

(define x (list (list 1 2) (list 3 4)))
x

(reverse x)

(define (deep-reverse items) 
  (if (not (pair? items)) 
      items 
      (append (deep-reverse (cdr items)) 
              (list (deep-reverse (car items)))))) 

(deep-reverse x)

(define y (list (list 1 2) 3))
y

(deep-reverse y)

(list )
