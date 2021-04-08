#lang sicp

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

;(* 2 2)
;(+ 2 (* 2 1))
;(+ 2 (+ 2 (* 2 0)))

(define (double x) (* x 2))
;(double 4)

(define (halve x) (/ x 2))
;(halve 8)

(define (** a b)
  (cond ((= b 1) a)
        ((even? b) (** (double a) (halve b)))
        (else (+ a (** a (- b 1)))))
  )

(** 3 6)
(** 6 3)
(+ 6 (** 6 2))
(+ 6 12)
