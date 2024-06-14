/*!
 @file       CREATE_FILES.h
 @date       09.05.24 [Создан]; 10.06.24 [Изменен: Внесены коментарии Doxygen]
 @version    v1.0
 @author     Mineev S. A. [mineeff20@yandex.ru]
 @copyright  FreeSoft.
 @brief      Содержит модуль CREATE_FILES.
 @details    CREATE_FILES представляет собой заголовочный файл, в котором объявлены переменные с найстройками стилей по умолчанию и содержимом файла guile.
*/

#ifndef CREATE_FILES_H
#define CREATE_FILES_H

#define DEFAULT_FILE_FIRSTTHEME_NAME "qss/ThemeFirst.css"
#define DEFAULT_FILE_FIRSTTHEME_CONTENT "QDialog { \
background-color: #abffd9; \
border: 1px solid black; \
color: #000000; \
} \
QDockWidget { \
    background-color: #abffd9; \
color: #000000; \
} \
QGroupBox { \
    background-color: #c0bfbc; \
border: 1px solid green; \
    border-color: #c01c28; \
    border-radius: 0; \
    border-style: solid; \
    border-width: 1; \
color: #241f31; \
font: Segoe UI,14,-1,5,400,0,0,0,0,0,0,0,0,0,0,1; \
} \
QLabel { \
    background-color: #d5d5d5; \
color: #000000; \
font: CaskaydiaCove Nerd Font,12,-1,5,400,0,0,0,0,0,0,0,0,0,0,1; \
} \
QMainWindow { \
    background-color: #d5d5d5; \
border: 1px solid black; \
    border-color: #707070; \
    border-radius: 10; \
    border-style: solid; \
    border-width: 3; \
color: #aa55ff; \
font: Segoe UI,14,-1,5,400,0,0,0,0,0,0,0,0,0,0,1; \
} \
QMdiArea { \
border: 5px solid #ffffff; \
    border-radius: 10px; \
    qproperty-background: white; \
} \
QMenuBar { \
    background-color: #abffd9; \
color: #000000; \
} \
QPushButton { \
    background-color: white; \
} \
QSliderButton { \
    qproperty-background: #99f5aa; \
    qproperty-color: #557d00; \
    qproperty-offBackground: #ffafaf; \
    qproperty-offColor: #F00; \
} \
QLabel#labelClassA { \
    background-color: #9141ac; \
color: #e01b24; \
} \
QLabel#labelClassB { \
    background-color: #c0bfbc; \
color: #e01b24; \
}"

#define DEFAULT_FILE_SECONDTHEME_NAME "qss/ThemeSecond.css"
#define DEFAULT_FILE_SECONDTHEME_CONTENT "QDialog { \
background-color: #abffd9; \
border: 1px solid black; \
color: #000000; \
} \
QDockWidget { \
    background-color: #abffd9; \
color: #000000; \
} \
QGroupBox { \
    background-color: #986a44; \
    border-color: #241f31; \
    border-radius: 0; \
    border-style: solid; \
    border-width: 1; \
color: #33d17a; \
} \
QLabel { \
    background-color: ; \
color: #ffffff; \
font: ; \
} \
QMainWindow { \
    background-color: #636363; \
border: 1px solid black; \
    border-color: #ffffff; \
    border-radius: 10; \
    border-style: solid; \
    border-width: 3; \
color: #ffffff; \
font: Segoe UI,24,-1,5,400,0,0,0,0,0,0,0,0,0,0,1; \
} \
QMdiArea { \
border: 5px solid #ffffff; \
    border-radius: 10px; \
    qproperty-background: white; \
} \
QMenuBar { \
    background-color: #abffd9; \
color: #000000; \
} \
QPushButton { \
    background-color: white; \
} \
QSliderButton { \
    qproperty-background: #99f5aa; \
    qproperty-color: #557d00; \
    qproperty-offBackground: #ffafaf; \
    qproperty-offColor: #F00; \
} \
QLabel#labelClassA { \
    background-color: #abffd9; \
color: #e01b24; \
} \
QLabel#labelClassB { \
    background-color: #986a44; \
color: #c0bfbc; \
} \
QLabel#labelClassC { \
color: #005500; \
}"

#define DEFAULT_FILE_GUILE_NAME "guile.scm"

#define DEFAULT_FILE_GUILE_CONTENT "(define-syntax print-Deriv \
\n (syntax-rules ( * ^ + - / ln cos sin sqrt sh csh th csch)  \
\n ((_) 0)  \
\n ((_ e) 	           (format #f \"~a\" e))  \
\n ((_ e1 ^ e2) 	       (format #f \"~a^~a\" e1 e2))  \
\n ((_ e1 / e2) 	       (format #f \"~a/~a\" e1 e2))  \
\n ((_ ( e1 ) / ( e2 ) ) (format #f \"(~a)/(~a)\" e1 e2))  \
\n ((_ e1 * e2)          (format #f \"~a*~a\" e1 e2))  \
\n ((_ e1 * ( e2 ) )     (format #f \"~a*~a\" e1 e2))  \
\n ((_ e1 + e2) 	       (format #f \"~a+~a\" e1 e2))  \
\n ((_ e1 - e2) 	       (format #f \"~a-~a\" e1 e2))  \
\n ((_ e1 * e2 + e* ...) (print-Deriv (format #f \"~a*~a\" e1 e2) + e* ...))  \
\n ((_ e1 * e2 - e* ...) (print-Deriv (format #f \"~a*~a\" e1 e2) - e* ...))  \
\n ((_ e1 + e2 * e* ...) (print-Deriv (format #f \"~a+~a\" e1 (print-Deriv e2 * e*)) ...))  \
\n ((_ e1 - e2 * e* ...) (print-Deriv (format #f \"~a-~a\" e1 (print-Deriv e2 * e*)) ...))  \
\n ((_ e1 * e2 ^ e3)     (format #f \"~a*~a^~a\" e1 e2 e3))  \
\n ((_ e1 ^ e2 * ln e3)  (format #f \"~a^~a*ln~a\" e1 e2 e3))  \
\n ((_ cos e1)           (format #f \"cos~a\" e1))  \
\n ((_ - sin e1 )        (format #f \"-sin~a\" e1))  \
\n ((_ sin e1) 	       (format #f \"sin~a\" e1))  \
\n ((_ sqrt e1) 	       (format #f \"sqrt~a\" e1))  \
\n ((_ ln e1) 	       (format #f \"ln~a\" e1))  \
\n ((_ sh e1) 	       (format #f \"sh~a\" e1))  \
\n ((_ csh e1) 	       (format #f \"csh~a\" e1))  \
\n ((_ th e1) 	       (format #f \"th~a\" e1))  \
\n ((_ csch e1)          (format #f \"csch~a\" e1))  \
\n ((_ - e1) 	       	   (format #f \"-~a\" e1))  \
\n ((_ + e1) 	           (format #f \"+~a\" e1))  \
\n ((_ f e) 	           (format #f \"~a~a\" f e))  \
\n )  \
\n)  \
\n \
\n \
\n(define-syntax deriv  \
\n (syntax-rules ( + - * ^ / )  \
\n  ((_ e1 + e* ... )  \
\n    (begin  \
\n    (cond  \
\n        ((number? e1) (print-Deriv (deriv e* ...)))  \
\n        ((and (or (equal? '(e1) '(t)) (equal? '(e1) '(x))) (or (equal? '(e* ...) '(t)) (equal? '(e* ...) '(x)))) (print-Deriv 2))  \
\n        ((or (equal? '(e1) '(t)) (equal? '(e1) '(x))) (print-Deriv 1 + (deriv e* ...)))  \
\n        ((or (equal? '(e* ...)  '(t)) (equal? '(e* ...) '(x))) (print-Deriv (deriv e1) + 1))  \
\n        (else (print-Deriv (deriv e1) + (deriv e* ...)))  \
\n    )))  \
\n  ((_ e1 * e2 + e* ... )  \
\n    (begin  \
\n    (cond  \
\n        ((number? '(e* ...) ) (print-Deriv (deriv e1 * e2)))  \
\n        (else (print-Deriv (deriv e1 * e2) + (deriv e* ...)))  \
\n    )))  \
\n  ((_ e1 * e2)  \
\n    (begin  \
\n    (cond  \
\n     ((and (or (equal? '(e1)  '(t)) (equal? '(e1) '(x))) (or (equal? '(e2) '(t)) (equal? '(e2) '(x))))  (deriv e1 ^ 2))  \
\n     ((and (number? e1) (number? e2)) (print-Deriv 0))  \
\n     ((and (or (equal? '(e1) '(t)) (equal? '(e1) '(x))) (number? e2)) (print-Deriv e2))  \
\n     ((and (or (equal? '(e2) '(t)) (equal? '(e2) '(x))) (number? e1)) (print-Deriv e1))  \
\n     ((and (or (equal? '(e1)  '(t)) (equal? '(e1) '(x))) (or (equal? '(e2) '(t)) (equal? '(e2) '(x))) ) (deriv e1 ^ 2))  \
\n    )))  \
\n  ((_ e1 ^ e2 + e* ... )  \
\n    (begin  \
\n        (print-Deriv (deriv e1 ^ e2) + (deriv e* ...))  \
\n    ))  \
\n  ((_ e1 ^ e2)  \
\n    (begin  \
\n        (if (number? e2)  \
\n         (if (number? e1)  \
\n          (print-Deriv 0)  \
\n          (print-Deriv e2 * e1 ^ (- e2 1))  \
\n         )  \
\n        (print-Deriv e1 ^ e2 * ln e1)  \
\n    )))  \
\n  ((_ ( e1* ... ) / ( e2* ... ))  \
\n  (begin  \
\n    (cond  \
\n        ((and (or (equal? '(e1* ...) '(t)) (equal? '(e1* ...) '(x))) (or (equal? '(e2* ...) '(t)) (equal? '(e2* ...) '(x)))) ((print-Deriv 1)))  \
\n        ((or (equal? '(e1* ...) '(t)) (equal? '(e1* ...) '(x))) (print-Deriv (print-Deriv (list (print-Deriv e2* ...)) - (list (deriv e2* ...)) * (list (print-Deriv e1* ...)) ) / (list (print-Deriv (list (print-Deriv e2* ...)) ^ 2))))  \
\n        ((or (equal? '(e2* ...) '(t)) (equal? '(e2* ...) '(x))) (print-Deriv (print-Deriv (list (deriv e1* ...)) * (list (print-Deriv e2* ...)) - (list (print-Deriv e1* ...)) ) / (list (print-Deriv (list (print-Deriv e2* ...)) ^ 2))))  \
\n        (else (print-Deriv (print-Deriv (list (deriv e1* ...)) * (list (print-Deriv e2* ...)) - (list (deriv e2* ...)) * (list (print-Deriv e1* ...)) )  / (list (print-Deriv (list (print-Deriv e2* ...)) ^ 2))))  \
\n    )))  \
\n  ((_ f ( e* ... ) )  \
\n   (cond  \
\n    ((equal? f 'sin)  \
\n    (begin  \
\n    (cond  \
\n      ((or (equal? '(e* ...) '(t) ) (equal? '(e* ...) '(x)))  \
\n           (print-Deriv (print-Deriv cos '(e* ...))))  \
\n      (else  \
\n        (print-Deriv (print-Deriv cos '(e* ...)) * (list (deriv e* ...)))  \
\n      )  \
\n    )))  \
\n    ((equal? f 'cos)  \
\n    (begin  \
\n        (print-Deriv (print-Deriv - sin '(e* ...)) * (list (deriv e* ...)))  \
\n    ))  \
\n    ((equal? f 'tg)  \
\n    (begin  \
\n        (print-Deriv (print-Deriv 1 / (print-Deriv (print-Deriv cos '(e* ...)) ^ 2)) * (list (deriv e* ...)))  \
\n    ))  \
\n    ((equal? f 'ctg)  \
\n    (begin  \
\n        (print-Deriv (print-Deriv -1 / (print-Deriv (print-Deriv sin '(e* ...)) ^ 2)) * (list (deriv e* ...)))  \
\n    ))  \
\n    ((equal? f 'asin)  \
\n    (begin  \
\n        (print-Deriv (print-Deriv 1 / (print-Deriv sqrt (print-Deriv 1 - (print-Deriv '(e* ...) ^ 2)))) * (list (deriv e* ...)) )  \
\n    ))  \
\n    ((equal? f 'acos)  \
\n    (begin  \
\n        (print-Deriv (print-Deriv -1 / (print-Deriv sqrt (print-Deriv 1 - (print-Deriv '(e* ...) ^ 2)))) * (list (deriv e* ...)) )  \
\n    ))  \
\n    ((equal? f 'atg)  \
\n    (begin  \
\n        (print-Deriv (print-Deriv 1 / (print-Deriv 1 + (print-Deriv '(e* ...) ^ 2))) * (list (deriv e* ...)) )  \
\n    ))  \
\n    ((equal? f 'actg)  \
\n    (begin  \
\n        (print-Deriv (print-Deriv -1 / (print-Deriv 1 + (print-Deriv '(e* ...) ^ 2))) * (list (deriv e* ...)) )  \
\n    ))  \
\n    ((equal? f 'ln)  \
\n    (begin  \
\n        (print-Deriv (print-Deriv 1 / '(e* ...)) * (list (deriv e* ...)) )  \
\n    ))  \
\n    ((equal? f 'lg)  \
\n    (begin  \
\n        (print-Deriv (deriv log 10 ( '(e* ...) )) * (list (deriv e* ...)) )  \
\n    ))  \
\n    ((equal? f 'sqrt)  \
\n    (begin  \
\n        (print-Deriv (print-Deriv 1 / (print-Deriv 2 * (print-Deriv sqrt '(e* ...)))) * (list (deriv e* ...)) )  \
\n    ))  \
\n    ((equal? f 'sh)  \
\n    (begin  \
\n        (print-Deriv (print-Deriv csh '(e* ...)) * (list (deriv e* ...)) )  \
\n    ))  \
\n    ((equal? f 'csh)  \
\n    (begin  \
\n        (print-Deriv (print-Deriv sh '(e* ...)) * (list (deriv e* ...)) )  \
\n    ))  \
\n    ((equal? f 'th)  \
\n    (begin  \
\n        (print-Deriv (print-Deriv 1 - (print-Deriv (print-Deriv f '(e* ...)) ^ 2)) * (list (deriv e* ...)) )  \
\n    ))  \
\n    ((equal? f 'cth)  \
\n    (begin  \
\n        (print-Deriv (print-Deriv  - (print-Deriv (print-Deriv csch '(e* ...)) ^ 2)) * (list (deriv e* ...)) )  \
\n    ))  \
\n    (else #f)  \
\n   )  \
\n  )  \
\n  ((_ f e1 ( e2* ... ) )  \
\n    (cond  \
\n     ((equal? f 'log)  \
\n     (begin  \
\n        (print-Deriv (print-Deriv 1 / (print-Deriv (print-Deriv '(e2* ...) * (print-Deriv ln (list e1))) )) * (list (deriv e2* ...)) )  \
\n     ))  \
\n     ((equal? f 'sqrt_n)  \
\n     (let [(value (- (/ 1 e1) 1))]  \
\n        (begin  \
\n            (print-Deriv (print-Deriv (print-Deriv 1 / e1) * (print-Deriv '(e2* ...) ^ (list value) )) * (list (deriv e2* ...))  )  \
\n        ) \
\n     ))  \
\n     ((equal? f 'pow)  \
\n      (begin  \
\n        (deriv e1 ^ (e2* ...) )  \
\n      ))  \
\n    (else  \
\n        #f  \
\n    )  \
\n  ))  \
\n  ((_ f ( g ( e ) ))  \
\n  (begin  \
\n     (print-Deriv (deriv f ( (print-Deriv g e ) ) ) * (deriv g ( e )))  \
\n   ))  \
\n  ((_ f ( g ( e* ... ) ))  \
\n  (begin  \
\n    (let ((s (format #f \"~a\" '(e* ...)) ))  \
\n     (let ((value (print-Deriv g s)))  \
\n       (print-Deriv (print-Deriv (deriv f ( s ) ) ) * (deriv g ( e* ... )) )  \
\n     ))  \
\n  ))  \
\n  ((_ e)  \
\n   (cond  \
\n    ((number? e) 0)  \
\n    ((equal? e 't) 1)  \
\n    ((equal? e 'x) 1)  \
\n    (else #f)  \
\n   ))  \
\n )  \
\n)  \
\n  \
\n(define t 't)  \
\n(define x 'x)  \
\n  \
\n(define sin 'sin)  \
\n(define cos 'cos)  \
\n(define tg 'tg)  \
\n(define ctg 'ctg)  \
\n  \
\n(define asin 'asin)  \
\n(define acos 'acos)  \
\n(define atg 'atg)  \
\n(define actg 'actg)  \
\n \
\n(define ln 'ln)  \
\n(define lg 'lg)  \
\n(define sqrt 'sqrt)  \
\n \
\n(define sh 'sh)  \
\n(define csh 'csh)  \
\n(define th 'th)  \
\n(define cth 'cth)  \
\n \
\n(define log 'log)  \
\n(define sqrt_n 'sqrt_n)  \
\n(define pow 'pow) \
\n"
#endif // CREATE_FILES_H
