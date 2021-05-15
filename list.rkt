#lang sicp
(#%provide list-ref)
(#%provide length)
(#%provide append)
(#%provide last-pair)
(#%provide reverse)
(#%provide map)
(#%provide count-leaves)
(#%provide deep-reverse)
(#%provide fringe)


(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (define (length-iter a count)
    (if (null? a)
        count
        (length-iter (cdr a) (+ 1 count))))
  (length-iter items 0))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))
      )
  )

(define (reverse items)
  (if (null? items)
      nil
      (append (reverse (cdr items)) (list (car items)))
      )
  )

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items))))
  )

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))
        )
  )

(define (deep-reverse items) 
  (if (not (pair? items)) 
      items 
      (append (deep-reverse (cdr items)) 
              (list (deep-reverse (car items))))))

(define (fringe items)
  (define (iter items result)
    (cond ((null? items) result)
          ((pair? items) (iter (car items) (iter (cdr items) result)))
          (else (cons items result))
          )
    )
  (iter items (list))
  )