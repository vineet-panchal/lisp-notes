; Review 2 Practice - Question 5
; Write a function MERGE-SORTED-LISTS that takes two sorted lists and a comparator and returns the result of merging the two sorted lists. For example,
; CL-USER> (merge-sorted-lists '(1 2 3 4 5) '(3 5 6 7 8) #'<) ==> (1 2 3 3 4 5 5 6 7 8)

(defun merge-sorted-lists-tail-recursive (lst1 lst2 comp &optional (acc '()))
  ;; base case: returns the reverse of the accumulator when both lst1 and lst2 are empty
  (cond ((and (null lst1) (null lst2)) (reverse acc))
        ;; if lst1 is empty, add the first element of lst2 to the front of the accumulator
        ((null lst1) (merge-sorted-lists-tail-recursive lst1 (cdr lst2) comp (cons (car lst2) acc)))
        ;; if lst2 is empty, add the first element of lst1 to the front of the accumulator
        ((null lst2) (merge-sorted-lists-tail-recursive (cdr lst1) lst2 comp (cons (car lst1) acc)))
        ;; both lists are not empty, if the comparison between the first element of lst1 and lst2 is true, add the element from lst1 to the front of the accumulator
        ((funcall comp (car lst1) (car lst2)) (merge-sorted-lists-tail-recursive (cdr lst1) lst2 comp (cons (car lst1) acc)))
        ;; the comparison between the first element of lst1 and lst2 is false, add the element from lst2 to the front of the accumulator
        (t (merge-sorted-lists-tail-recursive lst1 (cdr lst2) comp (cons (car lst2) acc)))))


(defun merge-sorted-lists-iterative (l1 l2 comp)
  "Merges the sorted lists l1 and l2 and returns the sorted resulting list"
  (let ((res ()))
    (do () ; Notice: no var initializations in the do-loop
        ((and (null l1) (null l2))) ; Just a test and no result-form
      (let ((i1 (first l1))
            (i2 (first l2)))
        (cond ((null i1) (dolist (i l2) (push i res))
               (return))
              ((null i2) (dolist (i l1) (push i res))
               (return))
              ((funcall comp i1 i2) (push i1 res)
               (setf l1 (rest l1)))
              (t (push i2 res)
                 (setf l2 (rest l2))))))
    (reverse res)))
