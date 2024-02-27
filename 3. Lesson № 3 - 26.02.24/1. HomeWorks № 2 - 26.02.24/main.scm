
; SECTION № 1: let and let*
#;
(let ; notnamed let
 ( ; bindings
	(x 1)
	(y 2)
 )
 ( ; body <exp1>
  + x y
 )
 (; body <exp2>
  - x y
 )
)

(define x 5) ; define global x = 5;
#;
(let ; notnamed let local/global x;
 ( ; bindings
	(x 1) ; local x = 1;
	(y x) ; since let, then there x = global x = 6 => y = 6;
 )
 (display ; body <exp1>
  (+ x y) ; expected result: 1 + 5 = 6;
 )
) ; result: 6;


;(newline) ; add newline to console;

#;
(let* ; notnamed let only local x;
 ( ; bindings
	(x 1) ; local x = 1;
	(y x) ; since let*, then there x = local x => y = 1;
 )
 (display ; body <exp1>
  (+ x y) ; expected result: 1 + 1 = 2;
 )
) ; result: 2;


;(newline)

; SECTION № 2: named let
#;
(let countdown ; named let One
 ( ; bindings
	(i 10) 
 )
 (if (= i 0) 'quite	; body let <exp1>
  (begin ; body if
	(display i)
	(newline)
	(countdown (- i 1)) ; recursion;
  )
 )
) ; result: 10 9 8 ...;

;(newline)

(define i 6)
#;
(let countdown ; named let Two - GLOBAL step;
 ( ; bindings
	(i 10) 
    (step (/ i 2))
 )
 (if (<= i 0) 'quite	; body let <exp1>; Здесь т. к. шаг произвольный, то мы можем попасть в отрицательные значения, поэтому добавляем знак меньше;
  (begin ; body if
	(display i)
	(newline)
	(countdown (- i step) step) ; recurtion;
  )
 )
) ; result: 10 7 4 1;

;(newline)

; #| - Начало многострочного комментария.
; |# - Конец многострочного комментария.
; #; - Экспонирует полное S-выражение.

#|
(let* countdown ; named let Two - LOCAL step; not vitally active;
 ( ; bindings
	(i 10) 
    (step (/ i 2))
 )
 (if (= i 0) 'quite	; body let <exp1>
  (begin ; body if
	(display i)
	(newline)
	;(countdown (- i step) step) ; recursion;
  )
 )
) ; result: 10 5;
|#

; SECTION № 3: letrec
#;
(letrec
 ; list binding's:
 ( ; elem's list binding's
  	(local-even  (lambda (n) (if (= n 0) #t (local-odd (- n 1) ) ) ) )
	(local-odd  (lambda (n) (if (= n 0) #f (local-even (- n 1) ) ) ) )
	(i 5)
 )
 ; elem's body:
 (display (list (local-even 21) (local-odd 21))) ; body <exp1>; Внутренний вызов функции local-even/local-odd с внутренний передачей параметров;
 (format #t "\ni = ~a;\n" i) 			 ; body <exp2>; Возвращается статус последнего <exp>
); result: 20 (#t #f), 21 (#f #t)


; SECTION № 4: letrec 2
#;
(display
 ( ; Круглые скобки - оператор выполнения;
  (letrec
   ; list binding's
   (
	 (f (lambda (x) x ) )
   )
   ; elem's body
   f ; Внутренний вызов функции f;
  ) 1 ; Внешняя передача параметра;
 )
); result: => 1;

#;
(let param
 ; bindings let
 (
	(x 5)
 )
 ; body let
 (letrec
  ; bindings letrec
  (
	(f (lambda (x) x))
  )
  ; body letrec
  f
 ) x
 ; (display (param 3))
)

#;
(let param
 ; bindings let
 (
	(x 5)
 )
 ; body let
 (define z 
  (
   (letrec
   ; bindings letrec
   (
	 (f (lambda (x) x))
   )
   ; body letrec
   f
   ) x
  )
 )
 ;(display z)
)

;(newline)

(define (quick-sort lst)
 (let rec
  ; bindings
  (
	(lst lst)
  )
  (define pre_post 
   (
    (letrec
	 ; bindings letrec
     (
	  (pre_post_form 
	   (lambda (pre_x post_x cdr_lst x) 
		(cond 
		 ((eqv? cdr_lst (list)) (cons pre_x post_x))
		 ( (< (car cdr_lst) x) ; Значения меньше x кладем в pre_x;
		   (begin 
			#;(format #t "pre_x: ~a; car: ~a; val: ~a\n" 
			  pre_x (car cdr_lst) (append pre_x (car cdr_lst)) )
			(pre_post_form (append pre_x (list (car cdr_lst))) post_x (cdr cdr_lst) x )
		   )
		 ) 
		 (else 	; Значения больше x кладем в post_x;
		  (begin 
		  ;(display post_x)
		   (pre_post_form pre_x (append post_x (list (car cdr_lst)) ) (cdr cdr_lst) x )
		  )
	     )
        )
	   ) 
      )
	 ) 
	 ; body letrec
	 pre_post_form 
	) (list) (list) (cdr lst) (car lst) 
   ) 
  )
  ; (display pre_post) ;for debug;
  ; (newline)
  (cond
   ((and (eqv? (car pre_post) (list)) (eqv? (cdr pre_post) (list)))  (list (car lst)) )
   ((eqv? (car pre_post) (list))  (append (list (car lst)) (rec (cdr pre_post) ))) ;(list (car lst)) )
   ((eqv? (cdr pre_post) (list))  (append (rec (car pre_post)) (list (car lst))))
   (else 				          (append (rec (car pre_post)) (list (car lst)) (rec (cdr pre_post))))
  )
 )
)

(define lsst1 (list 5 4 3 2 1 0 6 7 8 9 10))

(define lsst2 (list 1 7 5 4 9 3 8 0 6 2 10))

(define lsst3 (list 14 75 11 0 4 8 9 10 55))

(format #t "pre-quick_sort: \x1B[0;31m ~a \x1B[0m; 
		 => post-quick-sort: \x1B[0;32m ~a \x1B[0m;\n" lsst1 (quick-sort lsst1))

(format #t "pre-quick_sort: \x1B[0;31m ~a \x1B[0m; 
		 => post-quick-sort: \x1B[0;32m ~a \x1B[0m;\n" lsst2 (quick-sort lsst2))

(format #t "pre-quick_sort: \x1B[0;31m ~a \x1B[0m; 
		 => post-quick-sort: \x1B[0;32m ~a \x1B[0m;\n" lsst3 (quick-sort lsst3))

(define lsst4 (list 5 1 4 7 2 1 4 5))

(format #t "pre-quick_sort(dublicats): \x1B[0;31m ~a \x1B[0m; 
		 => post-quick-sort(dublicats): \x1B[0;32m ~a \x1B[0m;\n" lsst4 (quick-sort lsst4))


