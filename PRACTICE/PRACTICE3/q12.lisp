; Practice 3 - Question 12
; Write a function that removes duplicates from a list while maintaining the order of first occurrences.
(defun remove-int-duplicatesTR (lst &optional (acc '()))
  (cond ((null lst) (reverse acc))
        (t (progn
             (if (not (member (car lst) acc))
                 (remove-int-duplicatesTR (cdr lst) (append (list (car lst)) acc))
                 (remove-int-duplicatesTR (cdr lst) acc))))))

(defun remove-int-duplicatesTR2 (lst &optional (acc '()))
  (cond ((null lst) (reverse acc))
        (t (if (not (member (car lst) acc))
               (remove-int-duplicatesTR2 (cdr lst) (append (list (car lst)) acc))
               (remove-int-duplicatesTR2 (cdr lst) acc)))))

(defun remove-int-duplicatesTR3 (lst &optional (acc '()))
  (cond ((null lst) (reverse acc))
        ((not (member (car lst) acc)) (remove-int-duplicatesTR3 (cdr lst) (append (list (car lst)) acc)))
        (t (remove-int-duplicatesTR3 (cdr lst) acc))))

(defun remove-int-duplicatesR (lst)
  (cond ((null lst) '())
        ((member (car lst) (cdr lst)) (remove-int-duplicatesR (cdr lst)))
        (t (cons (car lst) (remove-int-duplicatesR (cdr lst))))))

(defun remove-int-duplicates (lst)
  (let ((result '()))
    (dolist (curr lst (reverse result))
      (when (not (member curr result))
          (setf result (append (list curr) result))))))
