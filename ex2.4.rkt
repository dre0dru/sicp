#lang sicp

(define (cons x y)
  (lambda (m) (m x y))
  )

(define (car z)
  (z (lambda (p q) p))
  )

(define pair (cons 1 2))

(car pair)
(car (cons 1 2))
(car (lambda (m) (m 1 2)))
((lambda (m) (m 1 2)) (lambda (p q) p)) ;selector (p q) passed to lambda (m) and selects p

(define (cdr z)
  (z (lambda (p q) q))
  )

(cdr pair)
