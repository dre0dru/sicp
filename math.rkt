#lang sicp

(#%provide average)
(#%provide double)
(#%provide halve)
(#%provide square)
(#%provide cube)
(#%provide divides?)
(#%provide smallest-divisor)
(#%provide prime?)
(#%provide identity)
(#%provide accumulate)
(#%provide accumulate-filtered)
(#%provide deriv)
(#%provide newton-transform)
(#%provide newtons-method)
(#%provide compose)
(#%provide repeated)
(#%provide smooth)


(define (average x y) (/ (+ x y) 2))
(define (double x) (* x 2))
(define (halve x) (/ x 2))
(define (square x) (* x x))
(define (divides? a b) (= (remainder b a) 0))
(define (cube x) (* x x x))
(define (identity x) x)

(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (find-divisor n 2)  )

(define (prime? n)
  (= n (smallest-divisor n)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (accumulate combiner null-value term a next b) 
  (define (iter a result) 
    (if (> a b)
        result 
        (iter (next a) (combiner result (term a))))) 
  (iter a null-value)
  )

(define (accumulate-filtered filter combiner null-value term a next b) 
  (define (iter a result) 
    (if (> a b)
        result 
        (iter (next a) (combiner result (if (filter a) (term a) null-value))))) 
  (iter a null-value)
  )

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (cond ((close-enough? guess next) next)
            ((newline)
             (display next)
             (try next))
            )))
  (try first-guess))

(define (deriv g)
  (define dx 0.00001)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (compose f g)
  (lambda (x) (f (g x)))
  )

(define (repeated f n) 
  (if (= n 1) 
      f 
      (compose f (repeated f (- n 1)))
      ))

(define (smooth f)
  (define dx 0.000001)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))