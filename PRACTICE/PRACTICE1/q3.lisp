; given a list of values, output a list of the largest and smallest values
; assume the given list has at least one value
; solve this question in the following ways:
; a) using a dolist structure to iterate through the values
; b) without a dolist or any form of indexing
(defun list-max-min-dolist (values)
  (let ((max (car values)) (min (car values)))
    (dolist (i values) 
      (when (> i max)
        (setf max i))

      (when (< i min)
        (setf min i))

      (list max min))))

