; Practice 3 - Question 7
; Write a function to calculate the factorial of any number.
(defun factorialTR (n &optional (product 1))
  (cond ((= n 0) product)
        ((< n 0) "Invalid Input")
        ((= n 1) product)
        (t (factorialTR (- n 1) (* product n)))))

(defun factorialR (n)
  (cond ((= n 0) 1)
        ((= n 1) 1)
        ((< n 0) "Invalid Input")
        (t (* n (factorialR (- n 1))))))

(defun factorial (n)
  (let ((product 1))
    (cond ((or (= n 0) (= n 1)) product)
          ((< n 0) "Invalid Input")
          (t (progn (do ((i 1 (1+ i)))
                        ((> i n) product)
                      (setf product (* product i))))))))
