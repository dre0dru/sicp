#lang sicp
(define (identity x) x)

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (accumulate-filtered filter combiner null-value term a next b)
  (define (apply-filter a)
    (if (filter a)
        (term a)
        null-value)
    )
  (if (> a b)
      null-value 
      (combiner (apply-filter a)
                (accumulate-filtered filter combiner null-value term (next a) next b))) 
  )

(define (sum-filtered filter term a next b)
  (accumulate-filtered filter + 0 term a next b)
  ) 

(sum-filtered prime? identity 2 inc 6)

(define (accumulate-filtered* filter combiner null-value term a next b) 
  (define (iter a result) 
    (if (> a b)
        result 
        (iter (next a) (combiner result (if (filter a) (term a) null-value))))) 
  (iter a null-value)
  )

(define (sum-filtered* filter term a next b)
  (accumulate-filtered* filter + 0 term a next b)
  ) 

(sum-filtered* prime? identity 2 inc 6)