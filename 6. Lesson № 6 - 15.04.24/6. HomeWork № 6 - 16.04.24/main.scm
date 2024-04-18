; SECTION # 1
(load "color.scm")

(define lst1 '(1 2 3))
(define lst2 '(2 3 4))

(define aList 
'( ; (KEY . VALUE)
  ( (1 2 3) . "_lst1_")
  ( (2 3 4) . "_lst2_")
  (1    . "_1_") 
 ) 
)

(display "Исследование работы с ассоциативными массивами! \n") 

(display (assoc '(1 2 3) '( ((1 2 3) 1) ((2 3 4) 2) ))) (newline); equal?
;(display (assv '(1 2 3) '( ((1 2 3) 1) ((2 3 4) 2) )))  ; eqv?
;(display (assq '(1 2 3) '( ((1 2 3) 1) ((2 3 4) 2) )))  ; eq?

(display (assoc '(0 2 3) '( ((1 2 3) 1) ((2 3 4) 2) )))  (newline); eq?
;(display (assq '(1 2 3) '( ((1 2 3) 1) ((2 3 4) 2) )))  ; eq?
;(display (assq '(1 2 3) '( ((1 2 3) 1) ((2 3 4) 2) )))  ; eq?

(display (assoc-ref '( ((1 2 3) "_1_") ((2 3 4) "_2_")) '(1 2 3) )) (newline) ; (1)
(display '(1 2 3))

(display (assoc lst1 aList)) 	  (newline); -> ((1 2 3) . "lst1"). #f
(display (assoc-ref aList lst1))  (newline) ; -> "lst1". #f
 
(display (assoc '(1 2 3) aList))  (newline); -> ((1 2 3) . "lst1"). #f
(display (assoc-ref aList lst1))  (newline) ; -> "lst1". #f

(display (assoc 1 aList)) 	  (newline) ; -> (1 . "_1_").
(display (assoc-ref aList 1)) 	  (newline) ; -> "lst1".

(display (assoc-set! aList '(7 8 9) "_3_")) (newline)
(display (assoc '(7 8 9) aList)) (newline)
(display aList) (newline)

(display (set! aList (assoc-set! aList '(7 8 9) "_3_"))) (newline)
(display (assoc '(7 8 9) aList)) (newline)
(display (assoc-ref aList '(7 8 9) )) (newline)

(display aList) (newline) (newline)

; e1 = aList
; e2 = '(x y z)

(define-syntax macro
 (syntax-rules ()
  ; [Правило № 1] ЕСЛИ переданы некоторые два элемента, 
  ;   ТО поискать во втором первый И 
  ;      В СЛУЧАЕ ОТСУТСТВИЯ применить правило добавления [2] и последующего правила распечатки [3], 
  ;      ИНАЧЕ сразу применить правило распечатки [3].
  ((_ e1 e2)    (let ((ei (assoc e2 e1))) (if (equal? ei #f) (macro #f e1 e2) (macro #t e1 e2)) ))
  ; [Правило № 2] ЕСЛИ переданы некоторые три элемента, причем первый соответствует `#f`, 
  ;   ТО добавить в первый второй и применить правило распечатки [3].
  ((_ #f e1 e2) (begin 
		 (set! e1 (assq-set! e1 e2 (+ (* (car e2) (car e2)) (* (cadr e2) (cadr e2)) (* (car (cddr e2)) (car (cddr e2)))))) 
		 (macro #t e1 e2)
		)) 
  ; [Правило № 3] EСЛИ переданы три элемента, причем первый соответствует `#t`,
  ;   ТО распечатать значение из e1 по ключу e2.
  ((_ #t e1 e2) (begin 
		 (format #t "~aAlist~a: ~a~a~a \n ~aKey~a: ~a~a~a ;\t ~aValue~a: ~a~a~a ;\n" 
			red end cyan e1 end green end  cyan e2 end yellow end cyan (assoc-ref e1 e2) end) 
		 (newline)))
 )
)

(display "Результаты: \n") 
; В случае задания последовательности define -> let -> lambda, переменные объявленные в let ведут себя как статические,
; что позволяет их использовать с сохранением предыдущих значений в последующих вызовах.
; В случае задания последовательности define -> lambda -> let такого эффекта не наблюдается.
(define sum-of-squares 
 (let ((aListi '()))
  (lambda (x y z)
     (macro aListi (list x y z)) ; тут проявляются отличия '(...) от (list ...).
  ) 
 )
)

;! Убедиться в правильности работы можно, если убрать вывод из правила № 2.
; В этом случае вызовы 1 и 3 не распечатают содержимое (т. к. произойдет добавление в список, но не распечатка), 
;  а вызовы 2 и 4 распечатают ранее сохраненное значение!

(sum-of-squares 1 2 3) ; -> 14;
(sum-of-squares 1 2 3)  ; -> 14;
(sum-of-squares 2 3 4) ; -> 13;
(sum-of-squares 1 2 3)  ; -> 14;
