#lang sicp
(#%require sicp-pict)
(#%provide flipped-pairs)
(#%provide split)
(#%provide right-split)
(#%provide up-split)
(#%provide corner-split)
(#%provide square-limit)
(#%provide square-of-four)
(#%provide make-vect)
(#%provide xcor-vect)
(#%provide ycor-vect)
(#%provide eq-vect?)
(#%provide add-vect)
(#%provide sub-vect)
(#%provide scale-vect)
(#%provide make-frame)
(#%provide origin-frame)
(#%provide edge1-frame)
(#%provide edge2-frame)
(#%provide frame-coord-map)


(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))

(define (split orig-placer split-placer) 
  (lambda (painter n) 
    (cond ((= n 0) painter) 
          (else 
           (let ((smaller ((split orig-placer split-placer) painter (- n 1)))) 
             (orig-placer painter (split-placer smaller smaller)))))))

(define right-split (split beside below))
(define up-split (split below beside))

;(define (right-split painter n)
;  (if (= n 0)
;      painter
;      (let ((smaller (right-split painter (- n 1))))
;        (beside painter (below smaller smaller)))))

;(define (up-split painter n)
;  (if (= n 0)
;      painter
;      (let ((smaller (up-split painter (- n 1))))
;        (below painter (beside smaller smaller))
;        ))
;  )

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (make-vect x y) (cons x y)) 
(define (xcor-vect vec) (car vec)) 
(define (ycor-vect vec) (cdr vec)) 
  
(define (eq-vect? v1 v2) 
  (and (= (xcor-vect v1) (xcor-vect v2)) 
       (= (ycor-vect v1) (ycor-vect v2)))) 
  
(define (add-vect v1 v2) 
  (make-vect (+ (xcor-vect v1) (xcor-vect v2)) 
             (+ (ycor-vect v1) (ycor-vect v2)))) 
(define (sub-vect v1 v2) 
  (make-vect (- (xcor-vect v1) (xcor-vect v2)) 
             (- (ycor-vect v1) (ycor-vect v2)))) 
(define (scale-vect s vec) 
  (make-vect (* s (xcor-vect vec)) 
             (* s (ycor-vect vec))))

(define (make-frame origin edge1 edge2) 
  (list origin edge1 edge2)) 
(define (origin-frame f) (car f)) 
(define (edge1-frame f) (cadr f)) 
(define (edge2-frame f) (caddr f)) 

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
               (scale-vect (ycor-vect v) (edge2-frame frame))))))