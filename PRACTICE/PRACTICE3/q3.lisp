; Practice 3 - Question 3
; Modify the previous question so that it works for mixed types.

(defun sum-deep-list-intTR (lst &optional (acc 0))
; optional argument: result set to 0
  (cond ((null lst) acc)
        ; BASE CASE: if list is null, return result
        ((integerp (car lst)) (sum-deep-list-intTR (cdr lst) (+ acc (car lst))))
        ; CONDITION 1: if the first element is of type integer
        ; recursively call the rest of the list and add the first element to the result
        ((listp (car lst)) (sum-deep-list-intTR (cdr lst) (+ acc (sum-deep-list-intTR (car lst)))))
        ; CONDITION 2: if the first element is of type list
        ; recursively call the rest of the list and add the recursive call of the first element to the result
        (t (sum-deep-list-intTR (cdr lst) acc))))
        ; DEFAULT: recursively call the rest of the list

(defun sum-deep-list-intR (lst)
  (let ((result 0)) ; set result to 0
    (cond ((null lst) result)
          ; BASE CASE: if list is null, return result
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
