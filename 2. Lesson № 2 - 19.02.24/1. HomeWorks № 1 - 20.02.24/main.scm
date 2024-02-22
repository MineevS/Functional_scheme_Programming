; @data 20.02.24
; @author mineeff20@yandex.ru
; @brief ...

(use-modules (ice-9 format))

;; (format #t "Запуск программы!\n")

(define PI 3.14159265358979323846264338279)

; SECTION № 1:

(define ListTrigonomFunc (list sin cos tan))

(define angleFuncSinGrad
 (lambda (grad) 
	((list-ref ListTrigonomFunc 0)  (/ (* PI grad) 180))
 )
)

(define angleFuncSinRad
 (lambda (rad) 
	((list-ref ListTrigonomFunc 0)  rad)
 )
)


;; (format #f "sin (0) = ~a\n" 	 (angleFuncSinGrad 0))
;; (format #t "sin (pi / 2) = ~a\n" (angleFuncSinRad (/ PI 2)))
;; (format #t "sin (pi / 3) = ~a\n" (angleFuncSinRad (/ PI 3)))

; SECTION № 2:

;; (format #t "~,2f\n" 3.141592) ; Предварительно импортировать модуль ice-9 format;

; SECTION № 3;

(define listParam (list 'a 'b 'c))

;; (format #t "car = ~a\n" (car listParam))
;; (format #t "cdr = ~a\n" (cdr listParam))

; SECTION № 4;

(define fact
 (lambda (x)
  (if (= x 1)
   1
   (* x (fact (- x 1)))
  )
 )
)

;; (format #t "fact 10 = ~a\n" (fact 10))

(define fact-body
 (lambda (x acc)
  (if (= x 1)
   acc
   (fact-body (- x 1) (* x acc))
  )
 )
)

(define fact-tail
 (lambda (x)
  (fact-body x 1)
 )
)

;; (format #t "fact-tail 10 = ~a\n" (fact-tail 10))

; SECTION № 5;

(define (intersperse a xs)  
  (if (null? xs)
      (list)
      [cons (car xs)
            (if (null? (cdr xs))
                (cdr xs)
                (cons a (intersperse a (cdr xs))))]))

(define add-between
 (lambda (lst delim)
  (intersperse delim lst)
 )
)
; SECTION № 6;

(define raw-table
 (lambda (listtable grad str)
  (if (eqv? listtable (list))
   (string-join str "  ") ; str
   (raw-table (cdr listtable) grad (append str (list (format #f "~,2f" ((car listtable) grad)))))
  )
 )
)

(define ListTrigonomFunc (list sin cos tan))

; (format #t "RES = ~a\n" (raw-table (list 1 2 3) (list)))

;; (format #t "grd |  sin   cos   tan\n")
;; (format #t " 0  | ~a\n" (raw-table ListTrigonomFunc 0.3 (list)))

; SECTION № 7:

(define raw-table
 (lambda (listtable grad str)
  (if (eqv? listtable (list))
   (string-join str "  ") ; str
   (raw-table (cdr listtable) grad (append str (list (format #f "~7,2f" ((car listtable) grad)))))
  )
 )
)

(define ListTrigonomFunc (list sin cos tan))

; (format #t "RES = ~a\n" (raw-table (list 1 2 3) (list)))

;; (format #t " grd |    sin      cos      tan\n")

(define print-table
 (lambda (start_grad end_grad step)
  (if (>= (- end_grad (+ start_grad)) 0.0)
   (begin
    (format #t " ~3d | ~a\n" start_grad (raw-table ListTrigonomFunc start_grad (list)))
    (print-table (+ start_grad step) end_grad step)
   )
  )
 )
)

; (format #t " 0  | ~a\n" (raw-table ListTrigonomFunc 0.3 (list)))
;(print-table 0 90 1)

; SECTION № 8:

; (display "\x1B[0;31mHello world!\x1B[0m\n")

; SECTION № 9:

(define raw-table
 (lambda (listtable grad str)
  (if (eqv? listtable (list))
   (string-join str "  ") ; str
   (raw-table (cdr listtable) grad (append str (list 
    (if (> ((car listtable) grad) 0.0)
     (format #f "\x1B[0;32m~8,2f\x1B[0m" ((car listtable) grad))
     (format #f "\x1B[0;31m~8,2f\x1B[0m" ((car listtable) grad))
	)))
   )
  )
 )
)

(define ctg (lambda (x) (/ 1.0 (tan x))))

;; (format #t "ctg(0) = ~a\n" (ctg 0.0))

(define ListTrigonomFunc (list sin cos tan ctg))

; (format #t "RES = ~a\n" (raw-table (list 1 2 3) (list)))

(format #t "\x1B[0;36m grd \x1B[0m | \x1B[0;36m    sin       cos       tan       ctg \x1B[0m  |\n")
(format #t "__________________________________________________\n")

(define print-table
 (lambda (start_grad end_grad step)
  (if (>= (- end_grad start_grad) 0.0)
   (begin
    (format #t "\x1B[0;33m ~4,0f \x1B[0m| ~a  |\n" start_grad (raw-table ListTrigonomFunc start_grad (list)))
    (print-table (+ start_grad step) end_grad step)
   )
  )
 )
)

(print-table 0.0 10.0 1.0)



