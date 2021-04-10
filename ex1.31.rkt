#lang sicp

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (identity x) x)

(product identity 1 inc 4) ; factorial

(define (product* term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a))))
    )
  (iter a 1))

(product* identity 1 inc 4) ; factorial

(define (pi n)
  (define (term a)
    (if (even? a) 
        (/ (+ a 2) (+ a 1)) 
        (/ (+ a 1) (+ a 2)))
    )
  (* 4 (product* term 1 inc n)))

(pi 1)