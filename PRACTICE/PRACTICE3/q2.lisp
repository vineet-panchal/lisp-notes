; Practice 3 - Question 2
; Write a function that calculates and returns the sum of all numeric elements in a deeply nested list.
; The function assumes all the elements are either lists or integers.

(defun sum-deep-listTR (lst &optional (acc 0))
  ;; base case: returns the accumulator when the list is empty
  (cond ((null lst) acc)
        ;; if the first element of lst is not a list, call the function with the rest of the list and add the value of the first element to the accumulator
        ((not (typep (car lst) 'list)) (sum-deep-listTR (cdr lst) (+ acc (car lst))))
        ;; the first element of the list is a list, call the function with the rest of the list and add the sum of all the elements to our accumulator
        (t (sum-deep-listTR (cdr lst) (+ acc (sum-deep-listTR (car lst)))))))

(defun sum-deep-listR (lst)
  (let ((result 0)) ; define result to 0
    (cond ((null lst) result)
          ; BASE CASE: if list is null, return result
          ((not (typep (car lst) 'list)) (+ (+ result (car lst)) (sum-deep-listR (cdr lst))))
          ; CONDITION 1: if the first element of the list is not type list, then
          ; add the updated result (add the first element) to the recursive call of the rest of the list
          (t (+ (+ result (sum-deep-listR (car lst))) (sum-deep-listR (cdr lst)))))))
          ; DEFAULT: if the first element is of type list
          ; add the updated result (add the recursive call of first element)
          ; to the recursive call of the rest of the list
