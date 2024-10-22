; Part 3 - Lecture 3
; searching and sorting arrays in Lisp

; Binary Search
; if the vector is sorted, we can implement binary search
; start from the middle and use divide and conquer to search
(defun bin-search (val vec &optional (pos 0))
  ; the function takes two arguments: val - the target value, vec - the sorted vector
  ; it also takes in one optional argument that is set to 0, which keeps track of the current index in the vector
  "If val is in vec, return pos, i.e, the position of val in the original vector; otherwise, return NIL"
  (if (> (length vec) 1) ; if the length of the vector is greater than 1, proceed with the algorithm
      (let* ((midpt (floor (length vec) 2)) ; set midpt to the midpoint index using floor division
             (midel (aref vec midpt))) ; set midel to the value of the midpoint index
        (cond ((< midel val) ; condition 1: check if the middle element is less than the target value
               (bin-search val (rtl:slice vec midpt) (+ pos midpt)))
              ; recursively call the function to the right half of the vector, from midpt onward
              ((> midel val) ; condition 2: check if the middle element is greater than the target value
               (bin-search val (rtl:slice vec 0 midpt) pos))
              ; recursively call the function to the left hald of the vector, from start to midpt
              (t (+ pos midpt)))) ; default: target value is equal to midel, return the current position
      (when (= (aref vec 0) val) ; if the length of the vector is 1, do not perform anymore division
        pos))) ; if the target is found, return the current index, else return NIL
; (bin-search 2 #(1 2 3 4 5 6)) ==> 1

; Selection Sort
; it moves left ot right as it builds the sorted prefix to the left of the current element
; in one pass, it finds the smallest or largest element to the right of the current element and then swaps them
(defun selection-sort (vec comp)
  ; the function takes two arguments: vec - the vector to be sorted, comp - an comparison function
  "Sorts vec using comp, a function"
  (dotimes (cur (1- (length vec)))
    ; loop over all elements of the vector, except the last element since it will be sorted later
    ; set cur to be the current index ranging from 0 to (length vec) - 1
    (let ((best (aref vec cur)) ; initialize best to the current element in the vector
          (idx cur)) ; initialize idx to the current index
      (do ((j (1+ cur) (1+ j))) ; j is initially cur+1 (the next element) and increments by 1 each iteration
          ((= j (length vec))) ; let j loop over all elements until it reaches the length of the vector
        (when (funcall comp (aref vec j) best) ; call the comparison function "comp" on the element at index j and best
          (:= best (aref vec j)
              idx j))) ; if the condition is true, update best to the element at index j and idx is set to j
           ; it keeps track of the best element found in the unsorted part of the array
      (rotatef (aref vec cur) (aref vec idx)))) ; swap the best element with the current element at index "cur"
  vec) ; return the vector
; (selection-sort #(3 1 0 7 8 2) #'<) ==> #(0 1 2 3 7 8)
; (selection-sort #(3 1 0 7 8 2) #'>) ==> #(8 7 3 2 1 0)


