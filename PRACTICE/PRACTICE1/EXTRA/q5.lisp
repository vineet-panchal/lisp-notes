; given m and n, output the sum of numbers from m to n inclusive
(defun sum-of-numbers (m n)
  (do ((i m (+ i 1)) (sum 0))
      ((> i n) sum)
    (setf sum (+ sum i))
    )

  )
