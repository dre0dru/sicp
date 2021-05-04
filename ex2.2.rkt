#lang sicp
(#%require "math.rkt")
(#%provide make-point)
(#%provide x-point)
(#%provide y-point)
(#%provide print-point)
(#%provide make-segment)
(#%provide start-segment)
(#%provide end-segment)
(#%provide midpoint-segment)


(define (make-point x y)
  (cons x y)
  )

(define (x-point point)
  (car point)
  )

(define (y-point point)
  (cdr point)
  )

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment start end)
  (cons start end)
  )

(define (start-segment segment)
  (car segment)
  )

(define (end-segment segment)
  (cdr segment)
  )

(define (midpoint-segment segment)
  (make-point (average (x-point (start-segment segment)) (x-point (end-segment segment)))
              (average (y-point (start-segment segment)) (y-point (end-segment segment)))
              )
  )

(define start (make-point 1 1))
(define end (make-point 3 3))

(define segment (make-segment start end))

(midpoint-segment segment)


