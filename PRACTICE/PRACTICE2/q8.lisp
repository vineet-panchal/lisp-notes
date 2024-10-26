; Review 2 Practice - Question 8
; Write a function IS-PALINDROME? that determines whether a given list is a palindrome (is the same forwards and backwards). For example,
; CL-USER> (is-palindrome? '(1 2 3 3 2 1))
; ==> T

;; recursively goes through a list and its reverse to ensure they are the same (they are a palindrome)
(defun is-palindrome?-tail-recursive (lst &optional (revlst (reverse lst)))
  ;; if lst is empty, we have gone through the entire list, and it is a palindrome
  (cond ((null lst) t)
        ; if the first element of our list and the first element of our reversed list is not the same, it is not a palindrome, return nil
        ((not (equal (car lst) (car revlst))) nil)
        ; check the rest both lists to make sure it is a palindrome
        (t (is-palindrome?-tail-recursive (cdr lst) (cdr revlst)))))

;; iteratively goes through a list and its reverse to ensure they are the same (they are a palindrome)
(defun is-palindrome?-iterative (lst)
  (let ((rev-lst (reverse lst)))
    ; accesses the value at each index for both lst and rev-lst to make sure the values are the same, if it is not the same, returns nil
    ; the dotimes will return true if it is able to iterate through all the indices without returning nil
    (dotimes (i (length lst) t)
      (unless (equal (nth i lst) (nth i rev-lst))
        (return nil)))))


