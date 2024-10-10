(defun fact (n)
  "Calculate the factorial of a non-negative integer N."
  (if (zerop n)
      1
      (* n (fact (1- n)))))
