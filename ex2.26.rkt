#lang sicp
(#%require "list.rkt")


(define x (list 1 2 3))
(define y (list 4 5 6))


(append x y) ;list of values
(cons x y) ;x appended to the start on y as list
(list x y) ;list of two values that are lists