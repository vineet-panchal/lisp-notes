; Practice 3 - Question 4
; Write a function that takes a nested list as an input and returns as a flattened list.

(defun flatten-listTR (lst &optional (acc '()))
  (cond ((null lst) acc)
        ((listp (car lst)) (flatten-listTR (cdr lst) (flatten-listTR (car lst) acc)))
        (t (flatten-listTR (cdr lst) (append acc (list (car lst)))))))

(defun flatten-listR (lst)
  (cond
    ((null lst) '())  ; Base case: if lst is empty, return an empty list
    ((listp (car lst))
     (append (flatten-listR (car lst)) (flatten-listR (cdr lst))))  ; Flatten the head, then concatenate with the flattened tail
    (t (append (list (car lst)) (flatten-listR (cdr lst))))))  ; Add the current element to the flattened tail
; (t (cons (car lst) (flatten-listR (cdr lst))))))
