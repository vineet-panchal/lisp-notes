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
(let ((x 3) (y (* x x))) (+ x y))
(let * (
        (a 2) (b 4) (c -1) (delta (- (* b b) (* 4 a c)))
        (res (sqrt delta)))
  (/ ( + (- b) res) (* 2 a)))
