; given an array, output the sum of akk the negative numbers in the array
(defun sum-of-negatives (arr)
  (let ((sum 0))
    (dotimes (i (length arr) sum)
      (when (> 0 (aref arr i))
        (setf sum (+ sum (aref arr i)))
        )

      )

    )

  )
