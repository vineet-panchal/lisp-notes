; create a function that receives a positive integer n as input
; the function should print the even numbers from 0 to n (inclusive)
; if given an odd integer, print all the even numbers up to the given value
; your function should also return the sum of the even numbers that you printed on the screen

(defun evenNums (num) ; create the function with one integer as the argument
  (let ((sum 0)) ; use the let structure and initialize sum to 0
    (dotimes (x (+ num 1) sum) ; use dotimes structure and start loop at 0 to num + 1, sum will be the return
      (when (= (mod x 2) 0) ; when x is an even number
        (print x) ; print x
        (setf sum (+ sum x)))))) ; set sum to sum + x
