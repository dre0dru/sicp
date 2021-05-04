#lang sicp
(#%require "math.rkt")
(#%require "ex2.2.rkt")


(define (make-rect b-l t-r)
  (cons b-l t-r)
  )

(define (left rect)
  (make-segment (car rect) (make-point (x-point (car rect)) (y-point (cdr rect))))
  )
(define (top rect)
  (make-segment (make-point (x-point (car rect)) (y-point (cdr rect))) (cdr rect))
  )
(define (right rect)
  (make-segment (cdr rect) (make-point (x-point (cdr rect)) (y-point (car rect))))
  )
(define (bottom rect)
  (make-segment (make-point (x-point (cdr rect)) (y-point (car rect))) (car rect))
  )

(define (seg-length seg) 
  (let ((s1 (start-segment seg)) 
        (s2 (end-segment seg))) 
    (let ((x1 (x-point s1)) 
          (y1 (y-point s1)) 
          (x2 (x-point s2)) 
          (y2 (y-point s2))) 
      (sqrt (+ (square (- x1 x2)) 
               (square (- y1 y2)))))))

(define (rect-perimeter rect)
  (* 2 (+ (seg-length (left rect)) (seg-length (bottom rect))))
  )

(define (rect-area rect)
  (* (seg-length (left rect)) (seg-length (bottom rect)))
  )

(define bottom-left (make-point 1 1))
(define top-right (make-point 3 4))

(define rect (make-rect bottom-left top-right))

(left rect)
(top rect)
(right rect)
(bottom rect)

(seg-length (left rect))

(rect-perimeter rect)
(rect-area rect)