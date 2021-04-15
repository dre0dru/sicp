#lang sicp

(define (cont-frac* n d k)
  (define (iter result step)
    (if (= step 0)
        result
        (iter (/ (n step) (+ (d step) result)) (- step 1))
        )
    )
  (iter 0 k))

; 1,2,1,1,4,1,1,6,1,1,8,...
; 1,2,3,4,5,6,7,8,9,10,11,...
(define (D-i k)
  (if (= 2 (remainder k 3))
      (/ (+ k 1) 1.5)
      1
      )
  )


(+ 2 (cont-frac* (lambda (i) 1.0)
                 D-i
                 13))
