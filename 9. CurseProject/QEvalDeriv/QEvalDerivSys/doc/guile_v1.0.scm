(define-syntax print-Deriv
 (syntax-rules ( * ^ + - / ln cos sin sqrt sh csh th csch)
 ((_) 0)
 ((_ e) 	           (format #f "~a" e))
 ((_ e1 ^ e2) 	       (format #f "~a^~a" e1 e2))
 ((_ e1 / e2) 	       (format #f "~a/~a" e1 e2))
 ((_ ( e1 ) / ( e2 ) ) (format #f "(~a)/(~a)" e1 e2))
 ((_ e1 * e2)          (format #f "~a*~a" e1 e2))
 ((_ e1 * ( e2 ) )     (format #f "~a*~a" e1 e2))
 ((_ e1 + e2) 	       (format #f "~a+~a" e1 e2))
 ((_ e1 - e2) 	       (format #f "~a-~a" e1 e2))
 ((_ e1 * e2 + e* ...) (print-Deriv (format #f "~a*~a" e1 e2) + e* ...))
 ((_ e1 * e2 - e* ...) (print-Deriv (format #f "~a*~a" e1 e2) - e* ...))
 ((_ e1 + e2 * e* ...) (print-Deriv (format #f "~a+~a" e1 (print-Deriv e2 * e*)) ...)) ;
 ((_ e1 - e2 * e* ...) (print-Deriv (format #f "~a-~a" e1 (print-Deriv e2 * e*)) ...))
 ((_ e1 * e2 ^ e3)     (format #f "~a*~a^~a" e1 e2 e3))
 ((_ e1 ^ e2 * ln e3)  (format #f "~a^~a*ln~a" e1 e2 e3))
 ((_ cos e1)           (format #f "cos~a" e1))
 ((_ - sin e1 )        (format #f "-sin~a" e1))
 ((_ sin e1) 	       (format #f "sin~a" e1))
 ((_ sqrt e1) 	       (format #f "sqrt~a" e1))
 ((_ ln e1) 	       (format #f "ln~a" e1))
 ((_ sh e1) 	       (format #f "sh~a" e1))
 ((_ csh e1) 	       (format #f "csh~a" e1))
 ((_ th e1) 	       (format #f "th~a" e1))
 ((_ csch e1)          (format #f "csch~a" e1))
 ((_ - e1) 	       	   (format #f "-~a" e1))
 ((_ + e1) 	           (format #f "+~a" e1))
 ((_ f e) 	           (format #f "~a~a" f e))
 )
)

(define-syntax deriv
 (syntax-rules ( + - * ^ / )
  ((_ e1 + e* ... )      
	(begin
	(cond
		((number? e1) (print-Deriv (deriv e* ...)))
		((and (or (equal? '(e1) '(t)) (equal? '(e1) '(x))) (or (equal? '(e* ...) '(t)) (equal? '(e* ...) '(x)))) (print-Deriv 2)) ; t + t, t + x; x + t, x + x;
		((or (equal? '(e1) '(t)) (equal? '(e1) '(x))) (print-Deriv 1 + (deriv e* ...)))
		((or (equal? '(e* ...)  '(t)) (equal? '(e* ...) '(x))) (print-Deriv (deriv e1) + 1))
		(else (print-Deriv (deriv e1) + (deriv e* ...)))
	)))
  ((_ e1 * e2 + e* ... )
	(begin (display "rules: ")
	(cond
		((number? '(e* ...) ) (print-Deriv (deriv e1 * e2)))
		(else (print-Deriv (deriv e1 * e2) + (deriv e* ...)))
	)))
  ((_ e1 * e2)
	(begin
	(cond
	 ((and (or (equal? '(e1)  '(t)) (equal? '(e1) '(x))) (or (equal? '(e2) '(t)) (equal? '(e2) '(x))))  (deriv e1 ^ 2))
	 ((and (number? e1) (number? e2)) (print-Deriv 0))
	 ((and (or (equal? '(e1) '(t)) (equal? '(e1) '(x))) (number? e2)) (print-Deriv e2))
	 ((and (or (equal? '(e2) '(t)) (equal? '(e2) '(x))) (number? e1)) (print-Deriv e1))
	 ((and (or (equal? '(e1)  '(t)) (equal? '(e1) '(x))) (or (equal? '(e2) '(t)) (equal? '(e2) '(x))) ) (deriv e1 ^ 2))
	)))
  ((_ e1 ^ e2 + e* ... ) 
	(begin
		(print-Deriv (deriv e1 ^ e2) + (deriv e* ...))
	))
  ((_ e1 ^ e2) 	
	(begin
		(if (number? e2)
		 (if (number? e1)
		  (print-Deriv 0)
		  (print-Deriv e2 * e1 ^ (- e2 1))
		 )
		(print-Deriv e1 ^ e2 * ln e1)
	)))
  ((_ ( e1* ... ) / ( e2* ... )) 
  (begin 
	(cond
		((and (or (equal? '(e1* ...) '(t)) (equal? '(e1* ...) '(x))) (or (equal? '(e2* ...) '(t)) (equal? '(e2* ...) '(x)))) ((print-Deriv 1)))
		((or (equal? '(e1* ...) '(t)) (equal? '(e1* ...) '(x))) (print-Deriv (print-Deriv (list (print-Deriv e2* ...)) - (list (deriv e2* ...)) * (list (print-Deriv e1* ...)) ) / (list (print-Deriv (list (print-Deriv e2* ...)) ^ 2))))
		((or (equal? '(e2* ...) '(t)) (equal? '(e2* ...) '(x))) (print-Deriv (print-Deriv (list (deriv e1* ...)) * (list (print-Deriv e2* ...)) - (list (print-Deriv e1* ...)) ) / (list (print-Deriv (list (print-Deriv e2* ...)) ^ 2))))
		(else (print-Deriv (print-Deriv (list (deriv e1* ...)) * (list (print-Deriv e2* ...)) - (list (deriv e2* ...)) * (list (print-Deriv e1* ...)) )  / (list (print-Deriv (list (print-Deriv e2* ...)) ^ 2))))
	)))
  ((_ f ( e* ... ) )
   (cond
	((equal? f 'sin) 
	(begin
	(cond
	  ((or (equal? '(e* ...) '(t) ) (equal? '(e* ...) '(x)))
		   (print-Deriv (print-Deriv cos '(e* ...))))
	  (else
		(print-Deriv (print-Deriv cos '(e* ...)) * (list (deriv e* ...)))
	  )
	)))
	((equal? f 'cos) 
	(begin 
		(print-Deriv (print-Deriv - sin '(e* ...)) * (list (deriv e* ...)))
	))
	((equal? f 'tg) 
	(begin
		(print-Deriv (print-Deriv 1 / (print-Deriv (print-Deriv cos '(e* ...)) ^ 2)) * (list (deriv e* ...)))
	))
	((equal? f 'ctg) 
	(begin
		(print-Deriv (print-Deriv -1 / (print-Deriv (print-Deriv sin '(e* ...)) ^ 2)) * (list (deriv e* ...)))
	))
	((equal? f 'asin) 
	(begin
		(print-Deriv (print-Deriv 1 / (print-Deriv sqrt (print-Deriv 1 - (print-Deriv '(e* ...) ^ 2)))) * (list (deriv e* ...)) )  
	))
	((equal? f 'acos) 
	(begin
		(print-Deriv (print-Deriv -1 / (print-Deriv sqrt (print-Deriv 1 - (print-Deriv '(e* ...) ^ 2)))) * (list (deriv e* ...)) )
	))
	((equal? f 'atg) 
	(begin
		(print-Deriv (print-Deriv 1 / (print-Deriv 1 + (print-Deriv '(e* ...) ^ 2))) * (list (deriv e* ...)) )
	))
	((equal? f 'actg) 
	(begin
		(print-Deriv (print-Deriv -1 / (print-Deriv 1 + (print-Deriv '(e* ...) ^ 2))) * (list (deriv e* ...)) )
	))
	((equal? f 'ln) 
	(begin
		(print-Deriv (print-Deriv 1 / '(e* ...)) * (list (deriv e* ...)) )
	))
	((equal? f 'lg) 
	(begin
		(print-Deriv (deriv log 10 ( '(e* ...) )) * (list (deriv e* ...)) )
	))
	((equal? f 'sqrt) 
	(begin
		(print-Deriv (print-Deriv 1 / (print-Deriv 2 * (print-Deriv sqrt '(e* ...)))) * (list (deriv e* ...)) )
	)) 
	((equal? f 'sh) 
	(begin
		(print-Deriv (print-Deriv csh '(e* ...)) * (list (deriv e* ...)) )
	))
	((equal? f 'csh) 
	(begin
		(print-Deriv (print-Deriv sh '(e* ...)) * (list (deriv e* ...)) )
	))
	((equal? f 'th) 
	(begin
		(print-Deriv (print-Deriv 1 - (print-Deriv (print-Deriv f '(e* ...)) ^ 2)) * (list (deriv e* ...)) )
	))
	((equal? f 'cth) 
	(begin
		(print-Deriv (print-Deriv  - (print-Deriv (print-Deriv csch '(e* ...)) ^ 2)) * (list (deriv e* ...)) )
	))
    (else #f)
   )
  ) 
  ((_ f e1 ( e2 ) )
	(cond
	 ((equal? f 'log) 
	 (begin
		(print-Deriv 1 / (print-Deriv (print-Deriv e2 * (print-Deriv ln e1)) ))
	 ))
	 ((equal? f 'sqrt_n) 
	 (let [(value (- (/ 1 e1) 1))] 
		(begin
			(print-Deriv (print-Deriv 1 / e1) * (print-Deriv e2 ^ value )))
	 ))
	 ((equal? f 'pow) 
	  (begin
		(deriv e1 ^ e2)
	  ))
	(else 
		#f
	)
  ))
  ((_ f ( g ( e ) ))  
  (begin
	 (print-Deriv (deriv f ( (print-Deriv g e ) ) ) * (deriv g ( e )))
   ))
  ((_ f ( g ( e* ... ) )) 
  (begin 
	(let ((s (format #f "~a" '(e* ...)) )) 
	 (let ((value (print-Deriv g s)))
	   (print-Deriv (print-Deriv (deriv f ( s ) ) ) * (deriv g ( e* ... )) )
	 ))
  ))
  ((_ e)
   (cond
    ((number? e) 0)
    ((equal? e 't) 1)
	((equal? e 'x) 1)
	(else #f)
   ))
 )
)

(define t 't)
(define x 'x)

(define sin 'sin)
(define cos 'cos)
(define tg 'tg)
(define ctg 'ctg)

(define asin 'asin)
(define acos 'acos)
(define atg 'atg)
(define actg 'actg)

(define ln 'ln)
(define lg 'lg)
(define sqrt 'sqrt)

(define sh 'sh)
(define csh 'csh)
(define th 'th)
(define cth 'cth)

(define log 'log)
(define sqrt_n 'sqrt_n)
(define pow 'pow)

(display "sin(2t)				= ") (display (deriv sin ( 2 * t ) )) 		(newline)
(display "sin(t)				= ") (display (deriv sin ( t ))) (newline)
(display "(5 * t)'     		    	= ") (display (deriv 5 * t)) 	  		(newline)
(display "(5 * t + 2)' 		    	= ") (display (deriv 5 * t + 2)) 		(newline)
(display "(2 + 5 * t)' 		    	= ") (display (deriv 2 + 5 * t)) 		(newline)
(display "(5 * t + t * 2)' 	    	= ") (display (deriv 5 * t + t * 2)) 		(newline)
(display "(5 * t + t * 2 + 3 * t)'	= ") (display (deriv 5 * t + t * 2 + 3 * t)) 	(newline)
(display "(5 + 4)'	                = ") (display (deriv 5 + 4)) 			(newline)
(display "(5 * 4)'	                = ") (display (deriv 5 * 4))			(newline)
(display "(t ^ 2)'	                = ") (display (deriv t ^ 2))			(newline)
(display "(2 ^ t)'	                = ") (display (deriv 2 ^ t))			(newline)
(display "[(t ^ 2) + (t ^ 3)]'		= ") (display (deriv t ^ 2 + t ^ 3))		(newline)
(display "[(2 ^ t) + (3 ^ t)]'		= ") (display (deriv 2 ^ t + 3 ^ t))		(newline)
(display "[(t ^ 2) + (2 ^ t)]'		= ") (display (deriv t ^ 2 + 2 ^ t))		(newline)
(display "[sin(t)]'			= ") (display (deriv sin ( t ))) 		(newline)
(display "[cos(t)]'			= ") (display (deriv cos ( t ))) 		(newline)
(display "[tg(t)]'			= ") (display (deriv tg ( t ))) 		(newline)
(display "[ctg(t)]'			= ") (display (deriv ctg ( t ))) 		(newline)
(display "[asin(t)]'			= ") (display (deriv asin ( t ))) 		(newline)
(display "[acos(t)]'			= ") (display (deriv acos ( t ))) 		(newline)
(display "[atg(t)]'			= ") (display (deriv atg ( t ))) 		(newline)
(display "[actg(t)]'			= ") (display (deriv actg ( t ))) 		(newline)
(display "[log(4, t)]'			= ") (display (deriv log 4 ( t ) )) (newline)
(display "[ln(t)]'			= ") (display (deriv ln ( t ))) 		(newline)
(display "[lg(t)]'			= ") (display (deriv lg ( t ))) 		(newline)
(display "[sqrt(t)]'			= ") (display (deriv sqrt ( t ))) 	(newline)
(display "[sqrt_n(t, 3)]'		= ") (display (deriv sqrt_n 3 ( t ))) (newline)
(display "[pow(t,2)]'			= ") (display (deriv pow 2 ( t ))) 	(newline)
(display "[sh(t)]'			= ") (display (deriv sh ( t ))) 		(newline)
(display "[csh(t)]'			= ") (display (deriv csh ( t ))) 		(newline)
(display "[th(t)]'			= ") (display (deriv th ( t ))) 		(newline)
(display "[cth(t)]'			= ") (display (deriv cth ( t ))) 		(newline)
(display "((t^2) / (3t))'	        = ") (display (deriv ( t ^ 2 ) / ( 3 * t ) ))  (newline)
(display "[sin( cos ( t ) )]'		= ") (display (deriv sin ( cos ( t ) ))) 	(newline)

(display "[sin( cos ( ln ( t ) ) ) )]'	= ") (display (deriv sin ( cos ( ln ( t ) ) ) ) ) (newline)
(display "[sin( cos ( ln ( tg ( t ) ) ) )]'	= ") (display (deriv sin ( cos ( ln ( tg ( t ) ) ) ) ) ) (newline)

