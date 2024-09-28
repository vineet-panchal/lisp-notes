; Week 1 - Lecture 3
; special forms continued

(defun convert-to-letter-grade (numeric-grade)
  "A function that takes in a final score, n, 0 <= n <= 100, and returns the respective grade."
  (case (floor numeric-grade 10)
    (10 "A") (9 "A") (8 "B") (7 "C") (6 "D")
    (otherwise "F")))

(defun mypair (x y msg)
  (case msg
    (sum (+ x y))
    (diff (abs (- x y)))
    (dist (sqrt (+ (* x x) (* y y))))
    (print (pprint x) (pprint y))))

(mypair 3 4 'sum) ; ==> 7
(mypair 4 3 'diff) ; ==> 1
(mypair 3 4 'dist) ; ==> 5.0

; global variables
(defvar *lowerb* 1) ; use earmuffs (**) when defining global variables


