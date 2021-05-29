#lang sicp
(#%require "list.rkt")

(define (unique-triples n) 
  (flatmap 
           (lambda (i) 
             (flatmap (lambda (j) 
                  (map (lambda (k) (list i j k)) 
                       (enumerate-interval 1 (- j 1)))) 
                  (enumerate-interval 1 (- i 1)))) 
             (enumerate-interval 1 n))
  )

(unique-triples 1)