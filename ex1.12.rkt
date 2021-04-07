#lang sicp

;         1
;       1   1
;     1   2   1
;   1   3   3   1
; 1   4   6   4   1

; 1
; 1 1
; 1 2 1
; 1 3 3 1
; 1 4 6 4 1

(define (pascal row col)
  (cond ((or (= col 1) (= col row)) 1)
        ((> col row) -1) ; invalid col row pair
        (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col))))
  )

(pascal 1 1)
(pascal 2 1)
(pascal 2 2)

(pascal 3 2)

(pascal 4 2)
(pascal 4 3)

(pascal 5 2)
(pascal 5 3)
(pascal 5 4)
