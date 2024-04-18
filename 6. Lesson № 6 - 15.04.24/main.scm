; SECTION № 1

(display 'hello)

(define-syntax std::ostream
  (syntax-rules (<< endl cout)
    ((_ cout << e* ...)   (std::ostream (current-output-port) << e* ...)) ; ... - остаток текста.
    ((_ p << endl) 	  (newline p)) ; _ - то, что уже обработали.
    ((_ p << e) 	  (display e p))
    ((_ p << e << e* ...) (begin (std::ostream p << e) (std::ostream p << e* ...)))
  )
)

(std::ostream
  cout << endl << endl << 10 << endl << endl
)

(define-syntax inf-calc
 (syntax-rules ()
  ((_) 0)
  ((_ e) e)
  ((_ e1 + e2 e* ...) (let ((t (+ e1 e2))) (inf-calc t e* ...)))
  ((_ e1 - e2 e* ...) (let ((t (- e1 e2))) (inf-calc t e* ...)))
  ((_ e1 * e2 e* ...) (let ((t (* e1 e2))) (inf-calc t e* ...)))
  ((_ e1 / e2 e* ...) (let ((t (/ e1 e2))) (inf-calc t e* ...)))
 )
)

(std::ostream
  cout
  << "hello"
  << " "
  << "World!"
  << endl
  << "The result of expr of ( 2 + 2) is "
  << (inf-calc 2 + 2)
  << endl
)

; SECTION № 2

; Практическая задача (чистые функции) - результат которой зависит только от набора переменной.
; Замыкание к чистым функциям не относит т. к. использует свободные переменные, а не только связанные.
; 

(define lst1 (list 1 2 3))
(define lst2 lst1)
(define lst3 (list 1 3 4))

(display (equal? lst1 lst2)) (newline) ; #t
(display (equal? lst1 lst3)) (newline) ; #f
(display (equal? lst2 lst3)) (newline) ; #f

; написать макрос для мемоизации функции.

