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
(#%provide tree-map)
(#%provide subsets)
(#%provide filter)
(#%provide accumulate)
(#%provide enumerate-interval)
(#%provide enumerate-tree)


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

(define (tree-map proc items)
  (map (lambda (x)
         (if (pair? x)
             (tree-map proc x)
             (proc x)
             )
         )
       items)
  )

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))
                  )
            )
        (append rest (map (lambda (x) (cons (car s) x)) rest)))
      )
  )

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))