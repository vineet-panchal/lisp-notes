; Review 2 Practice - Question 9
; Write a function called delete-node using recursion that takes a list and a number k. The function needs to delete the kth element and return the remaining list. This function assumes the first element is at index 1 - see the sample outputs below. Entering an invalid k value returns the original list.
; CL-USER> (delete-node ‘(1 2 3 4) 1)
; ==> (2 3 4)
; CL-USER> (delete-node '(1 2 3 4) 2)
; ==> (2 3 4)

(defun delete-node (myList coord &optional (acc '()))
  (cond ((null myList) (reverse acc)) ; empty list
        ((equal 0 coord) myList) ; 0 index invalid
        ((equal 1 coord) (append (reverse acc) (cdr myList))) ; first value, exclude
        (t (delete-node (cdr myList) (- coord 1) (cons (car myList) acc))))) ; recurse

