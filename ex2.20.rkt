#lang sicp

  
(define (same-parity first . items)
  (define (find-numbers items condition) 
    (if (null? items) 
        nil 
        (if (condition (car items)) 
            (cons (car items) (find-numbers (cdr items) condition)) 
            (find-numbers (cdr items) condition)))) 
  (if (odd? first) 
      (find-numbers items odd?) 
      (find-numbers items even?))) 


(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)
