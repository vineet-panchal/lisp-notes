; given a list of numbers, output a new list that contains only the even numbers in the list
; the ouput be in the same order as the input
(defun remove-odd (values)
  (let ((result (list)))
    (dolist (i values (reverse result))
      (if (= (mod i 2) 0) (setf result (cons i result))))))
