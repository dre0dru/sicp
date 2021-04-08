#lang sicp

(define (double x) (* x 2))
(define (halve x) (/ x 2))

(define (** a b)
  (define (iter a b n)
    (cond ((= b 0) n)
          ((even? b) (iter (double a) (halve b) n))
          (else (iter a (- b 1) (+ a n)))
     )
    )
  (iter a b 0)
  )

(** 7 8)
