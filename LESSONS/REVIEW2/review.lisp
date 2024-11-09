; Review 2
; Week 5-6 Review

; Higher Order Functions (Outside)
; ==> pass an function as the argument of another.
; ==> call the functions with #' before the function

; Ex: (defun insertion-sort (vec comp) ... ) ; comp is the function that is passed as an argument
; CL-USER> (insertion-sort #(6 4 5 1 3) #'<) ; call function comp with #'

; Higher Order Functions (Inside)
; ==> from inside the function a parameter represents a function.
; ==> use the funcall command to call the function with suitable arguments.

; Ex: (if (funcall comp element-1 element-2)
;         (swap-vals element-1 element2))



; Ex: Create a function that takes in alist and returns a list based on a function.
(defun getList (mylist validator)
  (let ((result '()))
    (dolist (curr mylist)
      (if (funcall validator curr)
          (setf result (cons curr result))))
   (reverse result)))
; (getList '(0 1 2 3 4 5) #'oddp) ==> (1 3 5)
; (getList '("A" "R" "e" "o" "p" "R") #'(lambda (c) (string= c "R"))) ==> ("R" "R")

; Ex: Write a tail-recursive function of the previous example.
(defun getListTR (mylist validator &optional (acc '()))
  (cond ((null mylist) (reverse acc))
        (t (progn (if (funcall validator (car mylist))
                      (push (car mylist) acc))
                  (getListTR (cdr mylist) validator acc)))))

; Ex: Write a recursive function of the previous example.
(defun getListR (mylist validator)
  (cond ((null mylist) '())
        ((funcall validator (car mylist)) (cons (car mylist) (getListR (rest mylist) validator)))
        (t (getListR (rest mylist) validator))))



; Ex: Write a function that checks whether a list is a palindrome or not.
(defun is-palindrome? (mylist)
  (let ((reversedList (reverse mylist)))
    (equal reversedList mylist)))
; (is-palindrome? '(1 2 1)) ==> T
; (is-palindrome? '(1 2 3 1)) ==> NIL

; Ex: Write a tail recursive function of the previous example.
(defun is-palindrome?TR (mylist &optional (reversedList (reverse mylist)))
  (cond ((null mylist) t)
        ((/= (car mylist) (car reversedList)) nil)
        (t (is-palindrome?TR (cdr mylist) (cdr reversedList)))))

; Ex: Write a recursive function of the previous example.
(defun is-palindrome?R (mylist)
  (let ((reversedList (reverse mylist)))
    (cond ((null mylist) t)
          ((/= (car mylist) (car reversedList)) nil)
          (t (is-palindrome?R (reverse (cdr (reverse (cdr mylist)))))))))



; Ex: Create a function that calculates the final price based on the original price with a discount.
; Original Price < $20 --> 5% discount
; $20 < Original Price <= $100 --> 10% discount
; Original Price > $100 --> 15% discount
; Original Price <= $0 --> "Invalid Price"
(defun discount-calculator (originalPrice)
  (cond ((and (< 0 originalPrice) (< originalPrice 20)) (* originalPrice 0.95))
        ((and (< 20 originalPrice) (<= originalPrice 100)) (* originalPrice 0.80))
        ((> originalPrice 100) (* originalPrice 0.85))
        ((<= originalPrice 0) "Invalid Price")))



; Ex: Create a recursive function that takes two integers, start and end,
; and return a list of integers from start to end (inclusive).
(defun generate-list (start end)
  (let ((result '()))
    (cond ((> start end) nil)
          ((= start end) (reverse (cons start result)))
          (t (cons start (generate-list (1+ start) end))))))

; Ex: Write a tail-recursive function of the previous example.
(defun generate-listTR (start end &optional (result '()))
  (cond ((> start end) nil)
        ((= start end) (reverse (cons start result)))
        (t (generate-listTR (1+ start) end (cons start result)))))



; Ex: Create a function that takes a list, a start index, & end index.
; Return a new list with all the elements from start to end (inclusive).
(defun list-slice (mylist start end)
  (let ((result '()) (length (length mylist)))
    (cond ((> start end) nil)
          ((>= start length) '())
          ((>= end length) (list-slice mylist start (1- length)))
          ((= start end) (reverse (cons (nth start mylist) result)))
          (t (cons (nth start mylist) (list-slice mylist (1+ start) end))))))
; (list-slice '(1 2 3 4 5) 0 6) ==> (1 2 3 4 5)
; (list-slice '(1 2 3 4 5) 0 4) ==> (1 2 3 4)
; (list-slice '(1 2 3 4 5) 1 4) ==> (2 3 4)
; (list-slice '("hello" 4 7 "world" 14.0) 2 4) ==> (7 "world")

; Ex: Write a tail-recursive function of the previous example.
(defun list-sliceTR (mylist start end &optional (result '()) (length (length mylist)))
  (cond ((> start end) (reverse result))
        ((>= start length) (reverse result))
        ((= start end) (reverse (cons (nth start mylist) result)))
        ((>= end length) (list-sliceTR mylist start (1- length) result length))
        (t (list-sliceTR mylist (1+ start) end (cons (nth start mylist) result) length))))
