
; SECTION № 1

; call/cc
; call-with-current-continuation
; (call/cc (lambda (c)  ... ))

; programm-with-a-hole;
;(+ 1 (call/cc
;	  (lambda (k)
;		(+2 (k 3))) ) )

;(+ 1 (call/cc (lambda (c) (+ 1 2  3 (c 10)))))

;(define context #f)
;(+ 1 (call/cc (set! context c) (+ 2 (c 3)) ))

;(context 10)
;(context 100)

;(+ 1 [])

; Запомнить контекст и в любой момент к нему вернуться.

;((lambda (arg) (+ 1 arg)) 2)

; Escaping Continuation

; SECTION № 1 - HomeWorks # 5

;(define Data '(1 2 3 4 5 6 7))

; Реализовать функцию `make-list-iterator`

;(define (make-list-iterator l)
; (let ((ret #f)
;  (letrec ((get-next-proc
;	(lambda ()
;	 (let loop ((l l))
;	  (if (null? l) 'end
;       (begin
;		(call/cc
;		 (lambda (continue)
;		  (set! get-netx-proc (lambda () continue 'dummy)))
;		  (ret (car l))
;		)
;	   )
;		(loo (cdr l))
;	  )
;	 )
;	)
;	)
;  ))
;  (lambda ()
;   (call/cc (lambda (c)
;   (set! ret c)
;	(get-next-proc)
;))))))


; Сделать как минимум две древесные структуры.

; Реализовать функцию compare для сравнения древесных структур.

;(define (compare-tree t1 t2)
; (let 
;  ((iter1 (make-tree-iter t1))
;	(iter2 (make-tree-iter t2))
;  )
;  (let loop ( (v1 (iter1)) (v2 (iter2)) )
;   (cond
;	((eq? v1 'end) (eq? v2 'end) )
;	((eq? v2 'end)) #f; (eq? v1 'end))
;	((eq? v1 v2) (loop (iter1) (iter2)))
;	(else #f)
;   )
;  )
; )
;)

; Итого:
; 1) Реализовать итератор списка
; 2) Реализовать итератор древесных структур
; 3) Реализовать сравнение древесных структур
