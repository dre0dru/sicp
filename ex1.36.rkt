#lang sicp

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (cond ((close-enough? guess next) next)
            ((newline)
             (display next)
             (try next))
            )))
  (try first-guess))

; x^x = 1000
; x = log(1000)/log(x)
; x = (1/2)*(x + log(1000)/log(x))

(fixed-point (lambda (y) (/ (log 1000) (log y))) 10.0) ; more steps
(fixed-point (lambda (y) (/ (+ y (/ (log 1000) (log y))) 2)) 10.0) ; less steps with average damping