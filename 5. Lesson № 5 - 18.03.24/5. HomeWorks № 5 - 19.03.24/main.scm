(load "color.scm")

(define Tree1 
'(
  ( 
   (() 4 ()) 
	2 
   (() 5 ()) 
  ) 
  1
  ( 
   (() 6 ()) 
	3 
   (() 7 ())
  )
 )
)

(define Tree2 Tree1)

(define Tree3 
'(
  ( 
   (() 1 ()) ; Замена 4 на 1
	2 
   (() 5 ()) 
  ) 
  4 ; Замена 1 на 4
  ( 
   (() 6 ()) 
	3 
   (() 7 ())
  )
 )
)

(define left-branch car)
(define right-branch caddr)
(define node-value cadr)	

(format #t "~aTree1~a: ~a~a~a;\n" red end green Tree1 end)
(format #t "~aTree2~a: ~a~a~a; (~aEqual Tree1~a)\n" red end green Tree2 end cyan end)
(format #t "~aTree3~a: ~a~a~a;\n" red end green Tree3 end)

(format #t "~aRecursive traverse~a: " blue end)

(define (Traverse-rec tree callback) 
 (if (not (null? tree))
  (begin
   (Traverse-rec (left-branch tree) callback)
   (callback (node-value tree))
   (Traverse-rec (right-branch tree) callback)
  )
 )
)

(define (print-key k) (format #t "~a~a~a " cyan k end)) 

(format #t "~aTree1~a\n" yellow end)
(Traverse-rec Tree1 print-key) (newline)

(define (make-tree-iterator tree)
 (let ((caller #f))
  (letrec ((traverse  ;; traverse procedure
	(lambda ()
	 (let loop ((tree tree))
		(if (not (null? tree))
		 (begin
			(loop (left-branch tree))
			;; -- do st-th with key
			(call/cc 
			  (lambda (rest-of-tree) 
				(set! traverse 
				  (lambda () (rest-of-tree 'dummy)))
				  (caller (node-value tree))
			  )
			)
			(loop (right-branch tree))
		 )
		)
	 )
	 (caller 'end)
	))) ;; letrec
	(lambda () ;; iterator procedure
		(call/cc (lambda (k) (set! caller k) (traverse)))
	) ;; iterator proc end
   )
 )
)

(format #t "~aIterating~a:\n" blue end)

(format #t "~aget-next-key1~a: ~aTree1~a\n" magenta end yellow end)
(define get-next-key1 (make-tree-iterator Tree1))
(format #t "~aget-next-key2~a: ~aTree1~a\n" magenta end yellow end)
(define get-next-key2 (make-tree-iterator Tree1))
(format #t "~aget-next-key1~a : ~a~a~a\n" red end cyan (get-next-key1) end) ; => 4
(format #t "~aget-next-key1~a : ~a~a~a\n" red end cyan (get-next-key1) end)
(format #t "~aget-next-key1~a : ~a~a~a\n" red end cyan (get-next-key1) end)
(format #t "~aget-next-key1~a : ~a~a~a\n" red end cyan (get-next-key1) end)

(format #t "~aget-next-key2~a : ~a~a~a\n" red end cyan (get-next-key2) end)
(format #t "~aget-next-key2~a : ~a~a~a\n" red end cyan (get-next-key2) end)
(format #t "~aget-next-key2~a : ~a~a~a\n" red end cyan (get-next-key2) end)
(format #t "~aget-next-key2~a : ~a~a~a\n" red end cyan (get-next-key2) end)

(format #t "~aget-next-key1~a : ~a~a~a\n" red end cyan (get-next-key1) end)
(format #t "~aget-next-key2~a : ~a~a~a\n" red end cyan (get-next-key2) end)

(define (compare-tree t1 t2)
 (let 
  ((iter1 (make-tree-iterator t1))
	(iter2 (make-tree-iterator t2))
  )
  (let loop ( (v1 (iter1)) (v2 (iter2)) )
   (cond
	((eq? v1 'end) (eq? v2 'end)  #t)
	((eq? v2 'end) #f)
	((eq? v1 v2) (loop (iter1) (iter2)))
	(else #f)
   )
  )
 )
)

(format #t "~acompare-tree Tree1 AND Tree2~a: ~a~a~a\n" 
	red end yellow (compare-tree Tree1 Tree2) end)
(format #t "~acompare-tree Tree1 AND Tree3~a: ~a~a~a\n" 
	red end yellow (compare-tree Tree1 Tree3) end)


(define data1 '(1 2 3 4 5 6 7))
(define data2 '(21 22 23 24 25 26 27))

(format #t "~adata1~a: ~a~a~a\n" magenta end yellow data1 end)
(format #t "~adata2~a: ~a~a~a\n" magenta end yellow data2 end)

(define (make-list-iterator l)
 (let ((ret #f))
  (letrec ((get-next-proc 
	(lambda ()
	 (let loop ((l l))
	  (if (null? l) 'end
	   (begin
		(call/cc 
		  (lambda (continue)
		   (set! get-next-proc 
			(lambda () (continue 'dummy))) ;)-
			(ret (car l))
		   )
		)
		(loop (cdr l))
	   )
	  )
	 )
	)))
	(lambda ()
	 (call/cc 
	  (lambda (c)
	   (set! ret c) (get-next-proc)
	  ))
	)
  )
 )
)

(format #t "~aget-next-key1~a: ~adata1~a\n" magenta end yellow end)
(define get-next-key1 (make-list-iterator data1))
(format #t "~aget-next-key2~a: ~adata2~a\n" magenta end yellow end)
(define get-next-key2 (make-list-iterator data2))

(format #t "~aget-next-key1~a : ~a~a~a\n" red end cyan (get-next-key1) end)
(format #t "~aget-next-key1~a : ~a~a~a\n" red end cyan (get-next-key1) end)
(format #t "~aget-next-key1~a : ~a~a~a\n" red end cyan (get-next-key1) end)
(format #t "~aget-next-key1~a : ~a~a~a\n" red end cyan (get-next-key1) end)

(format #t "~aget-next-key2~a : ~a~a~a\n" red end cyan (get-next-key2) end)
(format #t "~aget-next-key2~a : ~a~a~a\n" red end cyan (get-next-key2) end)
(format #t "~aget-next-key2~a : ~a~a~a\n" red end cyan (get-next-key2) end)
(format #t "~aget-next-key2~a : ~a~a~a\n" red end cyan (get-next-key2) end)

(format #t "~aget-next-key1~a : ~a~a~a\n" red end cyan (get-next-key1) end)
(format #t "~aget-next-key2~a : ~a~a~a\n" red end cyan (get-next-key2) end)
