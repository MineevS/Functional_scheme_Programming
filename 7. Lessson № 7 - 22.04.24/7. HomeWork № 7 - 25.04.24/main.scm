; SECTION № 1

; Вычисление чисел Фибоначчи [Eval Fibonacci Numbers].

(define (fib-rec n)
 (if (< n 2)
  n
  (+ (fib-rec (- n 1)) (fib-rec (- n 2)))
 )
)

; SECTION № 2

(define (fib-iter a b count)
 (if (= count 0)
  b
  (fib-iter (+ a b) a (- count 1))
 )
)

(define (fib-itr n)
 (fib-iter 1 0 n)
)

; SECTION № 3

(define (time func arg)
 (begin
  (define start-time (current-time)) ; get-internal-real-time, gettimeofday;
  (define res (func arg))
  (define end-time   (current-time))
  (format #t "elapsed time: ")
  (format #t " ~a " (- end-time start-time))
  (display "s\n")
  (format #t "Result: ~a\n" res)
 )
)

(time fib-rec 33)
(time fib-itr 33)

;(format #t "fib-rec(100) = ~a\n" (fib-rec 10))
;(format #t "fib-itr(100) = ~a\n" (fib-itr 10))

; SECTION № 4

;(define-syntax memoize
 ;(syntax-rules ()

 ;)
;)

(define (memoize op)
  (letrec ((get (lambda (key) (list #f)))
           (set (lambda (key item) 
		 (let ((old-get get)) 
		  (set! get (lambda (new-key) 
		    (if (equal? key new-key) (cons #t item) (old-get new-key)))
		  ))
                )))
  (lambda args (let ((ans (get args))) (if (car ans) (cdr ans) (let ((new-ans (apply op args))) (set args new-ans) new-ans)))))
)


(define mem-fib-rec (memoize fib-rec))
(define mem-fib-itr (memoize fib-itr))

(time mem-fib-rec 34)
(time mem-fib-itr 34)
(time mem-fib-rec 34)

;(define (fact-mem n)
