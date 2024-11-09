; Practice 3 - Question 7
; Write a function that takes an argument n.
; Find the sum of all numbers from 1 to n inclusive.
(defun sum-of-natural-numsTR (n &optional (acc 0))
  (cond ((= n 0) acc)
        (t (sum-of-natural-numsTR (- n 1) (+ acc n)))))

(defun sum-of-natural-numsR (n)
  (cond ((= n 0) 0)
        (t (+ n (sum-of-natural-numsR (- n 1))))))

(defun sum-of-natural-nums (n)
  (let ((sum 0))
    (dotimes (i (+ n 1) sum)
      (setf sum (+ sum i)))))
