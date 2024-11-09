; Practice 3 - Question 3
; Modify the previous question so that it works for mixed types.

(defun sum-deep-list-intTR (lst &optional (acc 0))
  (cond ((null lst) acc)
        ((integerp (car lst)) (sum-deep-list-intTR (cdr lst) (+ acc (car lst))))
        ((listp (car lst)) (sum-deep-list-intTR (cdr lst) (+ acc (sum-deep-list-intTR (car lst)))))
        (t (sum-deep-list-intTR (cdr lst) acc))))

(defun sum-deep-list-intR (lst)
  (let ((result 0))
    (cond ((null lst) result)
          ((integerp (car lst)) (+ (+ result (car lst)) (sum-deep-list-intR (cdr lst))))
          ((listp (car lst)) (+ (+ result (sum-deep-list-intR (car lst))) (sum-deep-list-intR (cdr lst))))
          (t (+ result (sum-deep-list-intR (cdr lst)))))))

(defun sum-deep-list-int (lst &optional (acc 0))
  ;; base case: returns the accumulator when the list is empty
  (cond ((null lst) acc)
        ;; if the first element of the list is an integer, call the function with the rest of the list and add the value of the first element to the accumulator
        ((typep (car lst) 'integer) (sum-deep-list-int (cdr lst) (+ acc (car lst))))
        ;; if the first element of the list is not an integer or a list, call the function with the rest of the list and the accumulator (not adding anything to acc)
        ((not (typep (car lst) 'list)) (sum-deep-list-int (cdr lst) acc))
        ;; the first element of the list is a list, call the function with the rest of the list and add the sum of all elements to our accumulator
        (t (sum-deep-list-int (cdr lst) (+ acc (sum-deep-list-int (car lst)))))))
