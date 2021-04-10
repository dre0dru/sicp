#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)

(define (integral-simpson f a b n)
  (define h (/ (- b a)
               n)
    )
  (define (y-k k)
    (f (+ a
          (* k h))
       )
    )
  (define (term k)
    (cond ((or (= k 0) (= k n)) (y-k k))
          ((even? k) (* 2 (y-k k)))
          (else (* 4 (y-k k)))
          )
    )
  (* (/ h 3)
     (sum term 0 inc n)
     )
  )

(integral-simpson cube 0 1 100)
(integral-simpson cube 0 1 1000)
  