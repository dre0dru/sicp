#lang sicp

(define (cont-frac n d k)
  (define (iter step)
    (if (= step k)
        (/ (n step) (d step))
        (/ (n step) (+ (d step) (iter (+ step 1))))
        )
    )
  (iter 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           13)

; for iterative solution need to work backwards
(define (cont-frac* n d k)
  (define (iter result step)
    (if (= step 0)
        result
        (iter (/ (n step) (+ (d step) result)) (- step 1))
        )
    )
  (iter 0 k))

(cont-frac* (lambda (i) 1.0)
           (lambda (i) 1.0)
           13)