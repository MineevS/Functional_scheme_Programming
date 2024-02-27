; @data 26.02.24
; @author mineev20@yandex.ru
; @version

(display (cons 1 2))

(display '(1 2))

(define p '(1 2))

(display (car p) newline)
(display (cdr p) newline)

(define data '(1 2 3 4 5 6 7 8 9 0))

(let loop ((l data))
 (if (null? l) 'quite
  (begin
   (format #t "\t~a\n" (car l))
   (loop (cdr l))
  )
 )
)

(define Reverse
 (lambda (l)
  (let loop ((l l) (res '()))
   (if (null? l) res
    (loop (cdr l) (cons (car l) res))
   )  
  )
 )
)

(format #t "Rec: ~a\n" (Reverse data))

(define l (list 1 2 3 4 5 6 7 8 9))

(list-ref l 5) ; от нуля

(list-set! l 6 (- (list-ref 1 20)))

(define p (cons 1 2))

(set-car! p 3)
(set-cdr! p 4)
