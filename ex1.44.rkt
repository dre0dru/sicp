#lang sicp

(define (compose f g)
  (lambda (x) (f (g x)))
  )

(define (repeated f n) 
  (if (= n 1) 
      f 
      (compose f (repeated f (- n 1)))
      )
  ) 

(define dx 0.000001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3))
  )

(define (square x) (* x x))

((smooth square) 5)

(((repeated smooth 3) square) 5)