#lang sicp

(#%require "rational_numbers.rkt")

(define (make-rat-norm n d)
  (if (positive? (* n d)) (make-rat (abs n) (abs d))
      (make-rat (- (abs n)) (abs d))
      )
  )

(print-rat (make-rat-norm 1 2))
(print-rat (make-rat-norm -1 2))
(print-rat (make-rat-norm 1 -2))
(print-rat (make-rat-norm -1 -2))
  
