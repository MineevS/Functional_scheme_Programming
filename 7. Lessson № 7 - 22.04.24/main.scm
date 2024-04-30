; SECTION № 1

(display 'hello)

(define func
 (lambda (x y z)
  (+ (* x x) (* y y) (* z z))
 )
)


(define-syntax memoize
 ls
(syntax-rules ()

(memoize func)
:wq
