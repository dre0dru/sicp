#lang sicp

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b) (= (remainder b a) 0))

(define (square x) (* x x))

(define (next test-divisor)
  (if (= test-divisor 2) 3 (+ test-divisor 2))
  )

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes lower upper) 
  (define (iter n) 
    (cond ((<= n upper) (timed-prime-test n) (iter (+ n 2))))) 
  (iter (if (odd? lower) lower (+ lower 1)))) 

(search-for-primes 1000000 1100000)