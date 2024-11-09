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
  (let ((result '())) ; initialize result list
    (dolist (curr mylist) ; loop through given list
      (if (funcall validator curr) ; if the current element is validated
          (setf result (cons curr result)))) ; set result list to add the current element
   (reverse result))) ; return the reverse of result
; (getList '(0 1 2 3 4 5) #'oddp) ==> (1 3 5)
; (getList '("A" "R" "e" "o" "p" "R") #'(lambda (c) (string= c "R"))) ==> ("R" "R")

; Ex: Write a tail-recursive function of the previous example.
(defun getListTR (mylist validator &optional (acc '())) ; add optional argument: result list
  (cond ((null mylist) (reverse acc)) 
        ; BASE CASE: if list is null, return reverse of result
        (t (progn (if (funcall validator (car mylist)) 
        ; DEFAULT: if the first element of the list is validated
                      (push (car mylist) acc)) 
                      ; push the first element into the result
                  (getListTR (cdr mylist) validator acc))))) 
                  ; else recursively call the rest of the list

; Ex: Write a recursive function of the previous example.
(defun getListR (mylist validator)
  (cond ((null mylist) '()) 
        ; BASE CASE: if list is null, return empty list
        ((funcall validator (car mylist)) 
        ; CONDITION 1: if the first element is validated
          (cons (car mylist) (getListR (rest mylist) validator))) 
          ; add the first element to the recursive all of the rest of the list
        (t (getListR (rest mylist) validator)))) 
        ; DEFAULT: recursively call the rest of the list



; Ex: Write a function that checks whether a list is a palindrome or not.
(defun is-palindrome? (mylist)
  (let ((reversedList (reverse mylist))) ; create the reversed list
    (equal reversedList mylist))) ; return if reversed list and original list equal
; (is-palindrome? '(1 2 1)) ==> T
; (is-palindrome? '(1 2 3 1)) ==> NIL

; Ex: Write a tail recursive function of the previous example.
(defun is-palindrome?TR (mylist &optional (reversedList (reverse mylist)))
; optional argument: reversed list of the original list
  (cond ((null mylist) t)
        ; BASE CASE: if list is null, return true (went through all the elements)
        ((/= (car mylist) (car reversedList)) nil)
        ; CONDITION 1: if the first element of list and the reversed list don't equal, return nil
        (t (is-palindrome?TR (cdr mylist) (cdr reversedList)))))
        ; DEFAULT: recursively call the rest of list and reversed list

; Ex: Write a recursive function of the previous example.
(defun is-palindrome?R (mylist)
  (let ((reversedList (reverse mylist))) ; define reversed list variable
    (cond ((null mylist) t)
          ; BASE CASE: if list is null, return true
          ((/= (car mylist) (car reversedList)) nil)
          ; CONDITION 1: if the first element of list and the reversed list don't equal, return nil
          (t (is-palindrome?R (reverse (cdr (reverse (cdr mylist)))))))))
          ; DEFAULT: recursively call the reverse of the rest of the elements and reverse of the rest of the elements
          ; call the function with the first and last element removed of list



; Ex: Create a function that calculates the final price based on the original price with a discount.
; Original Price < $20 --> 5% discount
; $20 < Original Price <= $100 --> 10% discount
; Original Price > $100 --> 15% discount
; Original Price <= $0 --> "Invalid Price"
(defun discount-calculator (originalPrice)
  (cond ((and (< 0 originalPrice) (< originalPrice 20)) (* originalPrice 0.95))
        ; CONDITION 1: if original price is between 0 and 20, return 0.95 times original price
        ((and (< 20 originalPrice) (<= originalPrice 100)) (* originalPrice 0.80))
        ; CONDITION 2: if original price is between 20 and 100, return 0.8 times original price
        ((> originalPrice 100) (* originalPrice 0.85))
        ; CONDITION 3: if original price is greater than 100, return 0.85 times original price
        ((<= originalPrice 0) "Invalid Price")))
        ; DEFAULT: return "Invalid Price" if original price is less than or equal to 0



; Ex: Create a recursive function that takes two integers, start and end,
; and return a list of integers from start to end (inclusive).
(defun generate-list (start end)
  (let ((result '())) ; define result as a empty list intially
    (cond ((> start end) nil)
          ; BASE CASE 1: if start is greater than end, return nil
          ((= start end) (reverse (cons start result)))
          ; BASE CASE 2: if start = end, add start to result, and return the reverse of result 
          (t (cons start (generate-list (1+ start) end))))))
          ; DEFAULT: add start to the recursive call of 1 + start

; Ex: Write a tail-recursive function of the previous example.
(defun generate-listTR (start end &optional (result '()))
; optional argument: result set to empty list
  (cond ((> start end) nil) 
        ; BASE CASE 1: if start is greater than end, return nil
        ((= start end) (reverse (cons start result)))
        ; BASE CASE 2: if start = end, add start to result, and return the reverse of result
        (t (generate-listTR (1+ start) end (cons start result)))))
        ; DEFAULT: recursively call 1 + start and add start to result



; Ex: Create a function that takes a list, a start index, & end index.
; Return a new list with all the elements from start to end (inclusive).
(defun list-slice (mylist start end)
  (let ((result '()) (length (length mylist))) 
  ; define result as a empty list, and length as the length of the list
    (cond ((> start end) nil)
          ; BASE CASE 1: if start is greater than end, return nil
          ((>= start length) '())
          ; BASE CASE 2: if start is greater than or equal to length, return empty list
          ((>= end length) (list-slice mylist start (1- length)))
          ; CONDITION 1: if end is greater than or equal to length
          ; then recursively call 1 - length
          ((= start end) (reverse (cons (nth start mylist) result)))
          ; CONDITION 2: if start = end, add the element at start index to result
          ; and return the reverse of result
          (t (cons (nth start mylist) (list-slice mylist (1+ start) end))))))
          ; DEFAULT: add the element at start index to the recursive call of start + 1
; (list-slice '(1 2 3 4 5) 0 6) ==> (1 2 3 4 5)
; (list-slice '(1 2 3 4 5) 0 4) ==> (1 2 3 4)
; (list-slice '(1 2 3 4 5) 1 4) ==> (2 3 4)
; (list-slice '("hello" 4 7 "world" 14.0) 2 4) ==> (7 "world")

; Ex: Write a tail-recursive function of the previous example.
(defun list-sliceTR (mylist start end &optional (result '()) (length (length mylist)))
; optional arguments: result as a empty list, and length as the length of the list
  (cond ((> start end) (reverse result))
        ; BASE CASE 1: if start is greater than end, return the reverse of result
        ((>= start length) (reverse result))
        ; BASE CASE 2: if start is greater than or equal to length, return the reverse of result
        ((= start end) (reverse (cons (nth start mylist) result)))
        ; CONDITION 1: if start = end, add the element at start index to result
        ; and return the reverse of result
        ((>= end length) (list-sliceTR mylist start (1- length) result length))
        ; CONDITION 2: if end is greater than or equal to length
        ; then recursively call 1 - length
        (t (list-sliceTR mylist (1+ start) end (cons (nth start mylist) result) length))))
        ; DEFAULT: recursively call 1 + start and add the element at start index to result
