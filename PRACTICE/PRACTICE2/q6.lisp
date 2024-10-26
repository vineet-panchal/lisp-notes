; Review 2 Practice - Question 6

; 2.a)
; Write a tail-recursive function SUM-DEEP-LIST that calculates and returns the sum of all numeric elements in a deeply nested list. The function assumes all the elements are either lists or integers. For example,
; CL-USER> (sum-deep-list '(1 2 3 4 (5 6) 7 (8 9 (10 11 (12) (13 14)) 15 (16)) 17 ((((18))) 19) 20))
; ==> 210

(defun sum-deep-list (lst &optional (acc 0))
  ;; base case: returns the accumulator when the list is empty
  (cond ((null lst) acc)
        ;; if the first element of lst is not a list, call the function with the rest of the list and add the value of the first element to the acc
        ((not (typep (car lst) 'list)) (sum-deep-list (cdr lst) (+ acc (car lst))))
        ;; the first element of the list is a list, call the function with the rest of the list and add the sum of all the elements to our acc
        (t (sum-deep-list (cdr lst) (+ acc (sum-deep-list (car lst)))))))

; 2.b)
; Modify your tail-recursive function in Part 1 so that it will work with a list of mixed types. Call the function SUM-DEEP-LIST-INT. It will return the sum of all integers in the given list. Make sure to modify all your recursive calls to the new function name, and ensure that your solution is tail recursive. For example,
; CL-USER> (sum-deep-list-int '(1 2 "hello" 3 4 4.0 (5 6) 7 (8 'hi 9 (10 11 (12) "bye" (13 14)) 15 (16)) 17 'goodbye ((((18))) 19) 20))
; ==> 210

(defun sum-deep-list-int (lst &optional (acc 0))
  ;; base case: returns the accumulator when the list is empty
  (cond ((null lst) acc)
        ; if the first element of the list is an integer, call the function with the rest of the list and add the value of the first element to the acc
        ((typep (car lst) 'integer) (sum-deep-list-int (cdr lst) (+ acc (car lst))))
        ; if the first element of the list is not an integer or a list, call the function with the rest of the list and the acc
        ((not (typep (car lst) 'list)) (sum-deep-list-int (cdr lst) acc))
        ; the first element of the list is a list, call the function with the rest of the list and add the sum of all elements to our accumulator
        (t (sum-deep-list-int (cdr lst) (+ acc (sum-deep-list-int (car lst)))))))
