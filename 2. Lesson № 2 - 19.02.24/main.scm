; @data 19.02.24
; @author Mineev S. A. [mineff20@yandex.ru]
; @brief ...

(format #t "Hello world!")

(define Pi 3.14159265358979323846264)

(define F 
 (lambda (x)
  (define N 100)
  (+ N x)
 )
)

(display (F 10)) (newline)
;;(display N) ; Символ N не определен!

; 2
(quote E) ; Символ вычисляется в своё имя.
(symbol? 'N)
(string? 'N)
(char? 'N)

;(let ( list local param) ... 

(let
 (
   (x 100)
   (y 2)
 )
 (+ x y)
)

(define Square_Equation
 (lmbda ( a b c)
  (let ((D ( - (* b b) (* 4 a c))))
   (cond
    ((< D 0) (list ))
    ((= D 0) (list (/ (- b) (* 2 a)))
    (else (list
           (/ (+ (- b) (sqrt D)) (* 2 a))
           (/ (- (- b) (sqrt D)) (* 2 a))
          )
     )
    )
   )
  )
 )
)

; (format "X^2+ 3x + 2" (Square_Equation))

;(let (())
	(define Pi 3.1415926535)
	(define Square (lambda (r) (* Pi r r)))
;)

(define MakeAdder (lambda (N) ; Замыкание(cloujer)
 (lambda (x) (+ x N))
)

(define Add10 (MakeAdder 10))

(format #t "5 + 10 = ~a\n" (Add10 5)

(let*  ((a 1) (b (+ a 1))) (display (+ a b))); В Последующих формах можно использовать переменные ранее определенные;
; 0 10
(letrec 
 (
  (loop 
   (lambda (i)
	 (if (< i 10)
	  (begin
		 (format #t "~a\n" i)
		 (loop (+i 1))
	   )
		 'quit
	 )
	)
   )
  ) (loop 0)
) 
)

(let Loop ( (i 0) (j 0) (k 0) )
 (if (< i 10)
  (begin (format #t "i=~a\t j=~a\t k=~a\n" (Loop (+ i 1) j k))
  'quit
 )
)
