; given a list of numbers, return T if all values in the list are positive
; return nil for any non-positive numbers (zero is non-positive)
(defun all-positive (values)
  (dolist (i values (return T))
    (if (< i 1) (return NIL))))
