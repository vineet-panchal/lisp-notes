; Practice 3 - Question 1
; Write a function that takes two sorted lists and a comparator and returns the result of merging the two sorted lists.
(defun merge-sorted-listsTR (lst1 lst2 comp &optional (acc '()))
  ;; base case: returns the reverse of the accumulator when both lst1 and lst2 are empty
  (cond ((and (null lst1) (null lst2)) (reverse acc))
        ;; if lst1 is empty, add the first element of lst2 to the front of the accumulator
        ((null lst1) (merge-sorted-listsTR lst1 (cdr lst2) comp (cons (car lst2) acc)))
        ;; if lst2 is empty, add the first element of lst1 to the front of the accumulator
        ((null lst2) (merge-sorted-listsTR (cdr lst1) lst2 comp (cons (car lst1) acc)))
        ;; both lists are not empty, if the comparison between the first element of lst1 and lst2 is true, add the element from lst1 to the front of the accumulator
        ((funcall comp (car lst1) (car lst2)) (merge-sorted-listsTR (cdr lst1) lst2 comp (cons (car lst1) acc)))
        ;; the comparison between the first element of lst1 and lst2 is false, add the element from lst2 to the front of the accumulator
        (t (merge-sorted-listsTR lst1 (cdr lst2) comp (cons (car lst2) acc)))))

(defun merge-sorted-listsR (lst1 lst2 comp)
  (let ((result '())) ; define result to be an empty list
    (cond ((and (null lst1) (null lst2)) (reverse result))
          ; BASE CASE: if list1 and list2 are null, return the reverse of result
          ((null lst1) (cons (car lst2) (merge-sorted-listsR lst1 (cdr lst2) comp)))
          ; CONDITION 1: if list1 is null, add the first element of list2
          ; to the recursive call of the rest of list2
          ((null lst2) (cons (car lst1) (merge-sorted-listsR (cdr lst1) lst2 comp)))
          ; CONDITION 2: if list2 is null, add the first element of list1
          ; to the recursive call of the rest of list1 
          ((funcall comp (car lst1) (car lst2)) (cons (car lst1) (merge-sorted-listsR (cdr lst1) lst2 comp)))
          ; CONDITION 3: call the comparison function on the first element of list1 and list2, if true,
          ; then add the first element of list1 to the recursive call of the rest of list1
          (t (cons (car lst2) (merge-sorted-listsR lst1 (cdr lst2) comp))))))
          ; DEFAULT: add the first element of list2 to the recursive call of the rest of list2
