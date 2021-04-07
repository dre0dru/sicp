#lang sicp

; n if n<3
; f(n-1) + 2f(n-2) + 3f(n-3)

(define (func-recursive n)
  (if (< n 3)
      n
      (+ (func-recursive (- n 1))
         (* 2 (func-recursive (- n 2)))
         (* 3 (func-recursive (- n 3))))
      )
  )

(func-recursive 3)
(func-recursive 4)


; f(0) = 0 (a)
; f(1) = 1 (b)
; f(2) = 2 (c)
; f(3) = f(2) + 2f(1) + 3f(0) -> 2 + 2 + 0 = 4
; f(4) = f(3) + 2f(2) + 3f(1) -> (f(2) + 2f(1) + 3f(0)) + 2f(2) + 3f(1) -> 4 + 4 + 3 = 11

; on each iteration
; a=b (prev-prev computed step)
; b=c (prev computed step)
; c=c+2b+3a (current step result)
; compute final value as c and store state variables for next iteration in a and b
; start with boundary state values for n<3
; going from bottom to top in iterative
; compute cumulative value and preserve values from previous steps
; from top to botton in recursive
(define (func-iterative n) 
  (define (func-iter a b c count) 
    (cond ((< count 0) count) 
          ((= count 0) a) 
          ((= count 1) b) 
          ((= count 2) c) ; main stop condition
          (else (func-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))) 
  (func-iter 0 1 2 n))

(func-iterative 3)
; 0 1 2 3
; 1 2 4 2 -> 4

(func-iterative 4)
; 0 1 2 4
; 1 2 4 3
; 2 4 11 2 -> 11