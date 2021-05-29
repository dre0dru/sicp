#lang sicp
(#%require sicp-pict)
(#%require "paint.rkt")

(define (split orig-placer split-placer) 
  (lambda (painter n) 
    (cond ((= n 0) painter) 
          (else 
           (let ((smaller ((split orig-placer split-placer) painter (- n 1)))) 
             (orig-placer painter (split-placer smaller smaller))))))) 

(define right-split (split beside below))
(define up-split (split below beside))

(paint (right-split einstein 4))
