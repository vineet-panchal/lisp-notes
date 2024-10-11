
; output the sum of all even numbers up to n
(defun sum-of-evens (n)
  (let ((sum 0))                          ; Initialize sum to 0
    (dotimes (i (+ n 1) sum)                  ; Iterate from 0 to n (inclusive)
      (when (= 0 (mod i 2))               ; Check if the number is even
        (setf sum (+ sum i))))            ; Add the even number to sum
))  

(defun sum-of-evens-do (n)
  (do ((i 2 (+ i 2)) (sum 0))
      ((> i n) sum)
    (setf sum (+ sum i))))
