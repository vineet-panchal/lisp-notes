; Practice 3 - Question 5
; Write a function that determines whether a given list is a palindrome or not.
(defun is-palindrome?TR (lst &optional (reversedList (reverse lst)))
  (cond ((null lst) t)
        ((= (car lst) (car reversedList)) (is-palindrome?TR (cdr lst) (cdr reversedList)))
        (t nil)))

(defun is-palindrome?R (lst)
  (let ((reversedList (reverse lst)))
    (cond ((null lst) t)
          ((= (car lst) (car reversedList)) (is-palindrome?R (cdr (reverse (cdr lst)))))
          (t nil))))
