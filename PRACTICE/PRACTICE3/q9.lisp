; Practice 3 - Question 9
; Create a function that takes a list as input and finds the maximum element in a list of numbers.
(defun max-elementTR (lst &optional (maximum (nth 0 lst)))
  (cond ((null lst) maximum)
        ((> (car lst) maximum) (max-elementTR (cdr lst) (setf maximum (car lst))))
        (t (max-elementTR (cdr lst) maximum))))

(defun max-elementR (lst)
  (cond
    ((null lst) nil)  ; Base case: if the list is empty, return nil
    ((null (cdr lst)) (car lst))  ; If there's only one element, it's the maximum
    (t (max (car lst) (max-elementR (cdr lst))))))  ; Recursively find the max between the first element and the max of the rest

(defun max-element (lst)
  (let ((maximum (nth 0 lst)))
    (dolist (curr lst maximum)
      (when (> curr maximum)
        (setf maximum curr)
        ))))
