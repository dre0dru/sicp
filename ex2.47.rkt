#lang sicp
(#%require "paint.rkt")

(define (make-frame origin edge1 edge2) 
  (list origin edge1 edge2)) 
(define (origin-frame f) (car f)) 
(define (edge1-frame f) (cadr f)) 
(define (edge2-frame f) (caddr f)) 

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
               (scale-vect (ycor-vect v) (edge2-frame frame))))))