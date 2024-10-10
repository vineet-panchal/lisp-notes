; Week 1 - Lecture 2
; special forms in lisp

; QUOTE special form
(quote (+ 2 3)) ; ==> (+ 2 3)
'(+ 2 3) ; ==> (+ 2 3)
(+ 2 3) ; ==> 5

; AND special form
(and 1 2 3) ; ==> 3
(and 0 1 NIL (+ 3 4) 3) ; ==> NIL
(and 0 1 2 (* 3 3)) ; ==> 9

; OR special form
(or 10 (* 3 3) 2 1) ; ==> 10
(or (> 5 6) (< 3 4) (= 1 2)) ; ==> T

; IF special form
(if NIL 4 (* 3 2)) ; ==> 6
(if (and 0 1 NIL (+ 3 4) 3) 3 10) ; ==> 10
(if (or 0 (* 3 3) 2 1) (+ 5 5) (* 10 10)) ; ==> 10

; LAMBDA special form
(lambda (x) (* x x)) ; ==> #<FUNCTION(LAMBDA (x)){535F802B}>
((lambda (x) (* x x)) 4) ; ==> 16
((lambda (x y) (+ (* x y) x)) 3 1) ; ==> 6
(map 'vector (lambda (x) (* x x)) #(1 2 3 4 5 6)) ; ==> #(1 4 9 16 25 36)

; LET special form
(let ((quatro 4)) (* quatro quatro)) ; ==> 16
(let ((x 3) (y 1)) (+ (* x y) x)) ; ==> 16
(let* ((x 3) (y (* x x))) (+ x y))
(let* (
        (a 2) (b 4) (c -1) (delta (- (* b b) (* 4 a c)))
        (res (sqrt delta)))
  (/ ( + (- b) res) (* 2 a)))

; examples
10 ; ==> 10
(+ 5 3 4) ; ==> 12
(- 9 1) ; ==> 8
(+ (* 2 4) (- 4 6)) ; ==> 6
(lambda (x y) (+ x y)) ; ==> 6
((lambda (x y) (+ x y)) (+ 2 1) ((lambda (x) (* x x)) 2)) ; ==> 7
(let ((a 5) (b 5) (c 30)) (+ (* a b) c)) ; ==> 50

; function special form
(defun average (x y)
  "Returns the average of x and y"
  (/ (+ x y) 2.0))

; common lisp built-in functions

; oddp function checks if any number is off or not
(oddp 3) ; ==> T
(oddp 4) ; ==> NIL

; make-even function creates an even number by adding 1
(make-even 4) ; ==> 4
(make-even 5) ; ==> 6

; cube function cubes a number
(cube 3) ; ==> 3

; add1 function adds 1 to a number
(add1 1) ; ==> 2

; add2 function adds 2 to a number
(add2 1) ; ==> 3

; max2 function returns the max of two arguments
(max2 2 3) ; ==> 3

; onemorep function returns T if its first argument is exactly one greater than its second argument
(onemorep 3 2) ; ==> T
