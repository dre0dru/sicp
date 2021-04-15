#lang sicp

(define (cont-frac* n d k)
  (define (iter result step)
    (if (= step 0)
        result
        (iter (/ (n step) (+ (d step) result)) (- step 1))
        )
    )
  (iter 0 k))

(define (tan-cf x k)
  (cont-frac* (lambda (i) (if (= i 1) x (- (* x x))))
              (lambda (i) (- (* 2 i) 1))
              k)
  )

(tan-cf 60 13)
