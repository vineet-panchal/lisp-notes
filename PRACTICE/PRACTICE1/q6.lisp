; create a function that takes two integers x and y as input.
; calculate and output the result of the following equation:
; (2x - 4y^2) * ((17 + x) / (y - 1))


(defun complex-math (x y)
  (let* ((a1 (* 2 x))
         (a2 (* 4 (expt y 2)))

         (b1 (+ 17 x))
         (b2 (- y 1))

         (c (- a1 a2))
         (d (/ b1 b2)))
    (* c d)))
