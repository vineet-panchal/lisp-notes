; evaluating mathematical expressions in lisp

; Ex #1: Evaluate (2 + √4 * 6) * (3 + 5 + 7), Output: 210.0
 (* (+ 2 (* 6 (sqrt 4))) (+ 3 5 7))

; Ex #2: Evaluate (2 - (3 - (6 + 4/5))) / (3 * (6 - 2))
(/ (- 2 (- 3 (+ 6 (/ 4 5)))) (* 3 (- 6 2)))
