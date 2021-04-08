#lang sicp

(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
(if (not (> (abs angle) 0.1))
angle
(p (sine (/ angle 3.0)))))

(sine 12.15)

; a) 5 times
; b) O(log(n)) since we are dividing input angle by 3 each time until it reaches values <0.1