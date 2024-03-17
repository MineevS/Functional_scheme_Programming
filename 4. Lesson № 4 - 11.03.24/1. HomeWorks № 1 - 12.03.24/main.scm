(load "color.scm")

; SECTION № 1:

(display red)
(display end)

(define al (list 1 2 3))
(define bl (list 1 2 3))

; (display (eqv? 	 al bl)) (newline) ; #f
; (display (equal? al bl)) (newline) ; #t

; SECTION № 2:

(define (Matrix x y)
 (let ( (X x)  (Y y))
   ; Methods
   (define (GetX)  X)
   (define (GetY)  Y)
   (define (Plus rw)
	(Matrix (map + X (rw 'GetX)) (map + Y (rw 'GetY)) )
   )
   (define (Diff rw)
	(Matrix (map - X (rw 'GetX)) (map - Y (rw 'GetY)))
   )
   (define (Transp) 
	(Matrix (list (car X) (car Y)) (append (cdr X) (cdr Y)))
   )
   (define (Mult rw)
	(Matrix ; format #t "[ ~a ] \n" (rw 'GetX) (rw 'GetY)
		(list 
			(apply + (map * X ( ((Matrix (rw 'GetX) (rw 'GetY)) 'Transp) 'GetX) ))
			(apply + (map * X ( ((Matrix (rw 'GetX) (rw 'GetY)) 'Transp) 'GetY) ))
		)
		(list
			(apply + (map * ( ((Matrix (rw 'GetX) (rw 'GetY)) 'Transp) 'GetX) Y))
			(apply + (map * ( ((Matrix (rw 'GetX) (rw 'GetY)) 'Transp) 'GetY) Y))
		)
	)
   )
   (define (Det)
	(- (* (car X) (car (cdr Y))) (* (car (cdr X)) (car Y)))
   )
   (define (Display) (format #t "~a[~a(~a~a ~a~a)~a;~a(~a~a ~a~a)~a]~a" 
	 green end red (car X) (car (cdr X)) end white end red (car Y) (car (cdr Y)) end green end))
  (lambda args
   (apply
    (case (car args)
      ; Patterns
	 ((GetX) GetX)
     ((GetY) GetY)
     ((GetM) GetM)
     ((Plus) Plus)
     ((Diff) Diff)
	 ((Mult) Mult)
	 ((Transp) Transp)
	 ((Det) Det)
	 ((Display) Display)
	 (else (begin (display "Invalid matrix!") (exit 1)))
    )
    (cdr args)
   )
  )
 )
)

(define xm
 (cons
  (list 0 2)
  (list 3 4)
 )
)

; (display xm) (newline)

(define ym
 (cons
  (list 1 0)
  (list 2 3)
 )
)

(define M1 (Matrix (car xm) (cdr xm)))
(define M2 (Matrix (car ym) (cdr ym)))

(begin (format #t "~aM1~a:      " yellow end)  (M1 'Display) (newline))
(begin (format #t "~aM2~a:      " yellow end)  (M2 'Display) (newline))

(begin (format #t "~aM1^T~a:    " yellow end)  ((M1 'Transp) 'Display) (newline))

(begin (format #t "~aM1 ~a~a+~a~a M2~a: " yellow end cyan end yellow end) ((M1 'Plus M2) 'Display)  (newline))
(begin (format #t "~aM1 ~a~a-~a~a M2~a: " yellow end cyan end yellow end) ((M1 'Diff M2) 'Display)  (newline))
(begin (format #t "~aM1 ~a~a*~a~a M2~a: " yellow end cyan end yellow end) ((M1 'Mult M2) 'Display)  (newline))

(begin (format #t "~aM1_Det~a: ~a ~a ~a" yellow end red (M1 'Det) end) (newline))
(begin (format #t "~aM2_Det~a: ~a ~a ~a" yellow end red (M2 'Det) end) (newline))


