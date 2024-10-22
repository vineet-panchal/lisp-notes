; Part 3 - Lecture 3
; searching and sorting arrays in Lisp

; Binary Search
; if the vector is sorted, we can implement binary search
; start from the middle and use divide and conquer to search
(defun bin-search (val vec &optional (pos 0))
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
(defun selection-sort (vec comp)
  "Sorts vec using comp, a function"
  (dotimes (cur (1- (length vec)))
    (let ((best (aref vec cur))
          (idx cur))
      (do ((j (1+ cur) (1+ j)))         ; j is initially cur+1
          ((= j (length vec)))
        (when (funcall comp (aref vec j) best)
          (:= best (aref vec j)
              idx j)))
      (rotatef (aref vec cur) (aref vec idx)))) ; this is the Lisp swap operator
  vec)
; (selection-sort #(3 1 0 7 8 2) #'<) ==> #(0 1 2 3 7 8)
; (selection-sort #(3 1 0 7 8 2) #'>) ==> #(8 7 3 2 1 0)


