
(apply sin (list 1))

(apply + (list 1 2 3 4 5 6 7))

(apply * (list 1 2 3 4 5 6 7))

(for-each display (list 1 2 3 4 5) ) (newline) ; Вызывает функцию для каждого аргумента

(for-each (lambda (x) (format #t "~a\n" x)) (list 1 2 3 4 5))

;(map) ; Все списки должны быть одинаковой длины

; HomeWork: Реализовать умножение квадратных матриц;
; Замкнутая переменная - это переменная, которая функция используется, но не владеет.
; Объект имеет состояние и некоторое поведение
; Создать объект как набор функций;

;(define (myclass)
 ;(let 
  ;((mypara1 0) (myparam2 1))
  ;(define (myFunc1) ...)
 ; (define (myFunc2) ...)
;)

(define (make-v2 x y)
 (let ((X x) (Y y))
  (define (GetX) X)
  (define (GetY) Y)
  (define (Plus v2)
	(make-v2 (+ (v2 'GetX) X) (+ (v2 'GetY) Y))
  )
  (define (Scalar v2)
	(+ (* (v2 'GetX) X) (* (v2 'GetY) Y))
  )
  (define (Display) (format #t "(~a, ~a)" X Y))
  (lambda args
   (apply
	(case (car args)
	 ((GetX)  GetX)
     ((GetY)  GetY)
	 ((Plus)  Plus)
	 ((Scalar) Scalar)
	 ((Display) Display)
	 (else (begin (display "Inv m!\n") (exit 1)))
	)
	(cdr args)
   )
  )
 )
)

(define V1 (make-v2 0 1))
(define V2 (make-v2 1 0))

(V1 'Display)				(newline)
(V2 'Display)				(newline)
((V1 'Plus V2) 'Display) 	(newline)
(display  (V1 'Scalar V2)) 	(newline)

; Реализовать с помощью этого примера операции над матрицами.


