; Review of Parts 1-5

; Time Complexity ==> Metric used to evaluate and compare algorithms

; Big-O Notation
; O(n!) ==> Factorial
; O(2^n) ==> Exponential
; O(n^#) ==> Polynomial
; O(n log n) ==> Log-Linear

; O(n) ==> Linear
; the time scales linearly with the # of elements in the array
; Ex: Linear search checks every element in order. Every new
    ; element in the array increases the duration by constant time

; O(log n) ==> Logarithmic
; algorithms that split the work in half each iteration
; Ex: Binary search cuts the array in half with each iteration. It
    ; drastically reduces the # of elements that need to be visited
    ; each iteration.

; O(1) ==> Constant
; regardless of the # of elements in the data structure, the
; algorithm takes the same amount of time to complete.
; Ex: retrieving data at an index: arr[12]



; Code To Big-O

; Ex 1:
; (setf a 1)
; (setf b 2)
; (setf c 3)
; (setf d 4)
; T(n) = 1 + 1 + 1 + 1 = 4 = O(4)
; Time Complexity = O(1)

; Ex 2:
; (dotimes (x n)
;   (setf a 1)
;   (setf b 2)
;   (setf c 3)
;   (setf d 4))
; T(n) = {n - 1 | x = 0} ∑ (1 + 1 + 1 + 1) = n(1)
; Time Complexity = O(n)

; Ex 3:
; (dotimes (x n)
;   (dotimes (y n)
;     (setf 1)))
; T(n) = {n - 1 | x = 0} ∑ ({n - 1 | y = 0} ∑ (1))
; T(n) = {n - 1 | x = 0} ∑ (n)
; Time Complexity = O(n^2)

; Ex 4:
; (do ((x 1 (* x 5))
;     ((>= x n))
;   (setf a 1))
; T(n) = {log5^n-1 | p = 0} ∑ (1) = (log5^n)
; Time Complexity = O(log n)



; Linear Search ==> O(n)
; ==> searches over all the elements in a list starting with the first
(defun linear-search (n lst)
  (dolist (i lst)
    (when (= (nth i lst) n)
      (return i))))
; (linear-search 1 '(5 4 3 2 1)) ==> 4



; Binary Search ==> O(log n)
; ==> given a sorted array, repeatedly divide the array in 2
; ==> discard the half without the element each iteration
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



; Selection Sort ==> O(n^2)
; ==> look through the entire list for the smallest element and swap it with the first element. Move onto the next.
; ==> it moves left to right as it builds the sorted prefix to the left of the current element
; ==> in one pass, it finds the smallest or largest element to the right of the current element and then swaps them
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



; Insertion Sort ==> O(n^2)
; ==> if the next element is less than your current element, repeatedly swap 
; it to the left until is is in the current position
; ==> if the next element is greater than your current element, continue
; moving to the right to check the next element.  
(defun insertion-sort (vec comp)
; the function takes in two arguments: vec - the vector to be sorted
; comp - a comparison function
  (dotimes (i (1- (length vec)))
  ; the outer loop iterates from the start of the vector to the second last element
    (do ((j i (1- j)))
        ((minusp j))
    ; start an inner loop, with index j, initially set to i
    ; in each iteration, j is decremented by 1 '(1- j)'
    ; stop the loop when j is negative '(minusp j)'
      (if (funcall comp (aref vec (1+ j)) (aref vec j))
      ; use the comparison function to check if the neighbour j should be before or after
          (rotatef (aref vec (1+ j)) (aref vec j))
          ; swap j and its neighbour
          (return))))
  vec) ; return the vector
; (insertion-sort #(7 8 2 1 3 4) #'<) ==> #(1 2 3 4 7 8)
; (insertion-sort #(7 8 2 1 3 4) #'>) ==> #(8 7 4 3 2 1)



; Bubble Sort ==> O(n^2)
; iterate through elements, swapping with the neighbour if two elements are out of order.
; it puts the largest elements to the end of the list with each iteration.
(defun bubble-sort (vec comp)
; the function takes in two argument: arr - the array to be sorted and comp - an comparison function
  "Sorts the vector `vec` in-place using the bubble sort algorithm and
   the provided comparison function `comp`. Returns the sorted vector."
  (let ((n (length vec)))
  ; define the length of the array to an array, used to decrement later
    (dotimes (i n)
      ;; Outer loop to repeat the process `n` times. The last `i` elements are already sorted.
      (dotimes (j (- n i 1))
        ;; Inner loop goes from the beginning of the vector up to `n - i - 1`.
        ;; Each pass "bubbles" the largest unsorted element to the right end of the vector.
        (when (funcall comp (aref vec (1+ j)) (aref vec j))
          ;; If `vec[j+1]` should come before `vec[j]` (based on `comp` function), swap them.
          (rotatef (aref vec j) (aref vec (1+ j)))))
          ;; `rotatef` swaps the elements at `vec[j]` and `vec[j+1]`.
    ))
  vec) ; Return the sorted vector.



; Merge Sort ; O(n log n)
; Divide the array into two halves, recursively sort them, and then merge them.
; Iterate through the new sorted arrays, take the lowest value and insert it to the resulting array.
(defun merge-sorted-lists (list1 list2 comp)
  "Merges two sorted lists `list1` and `list2` into a single sorted list using `comp` as the comparison function."
  (cond
    ((null list1) list2)  ;; If `list1` is empty, return `list2`.
    ((null list2) list1)  ;; If `list2` is empty, return `list1`.
    ((funcall comp (car list1) (car list2))
    ; If `comp` returns true for the first element of `list1` and `list2`,
    ; then `car list1` is smaller, so include it at the start of the merged list.
     (cons (car list1) (merge-sorted-lists (cdr list1) list2 comp)))
    (t
    ; Otherwise, `car list2` is smaller, so include it at the start of the merged list.
     (cons (car list2) (merge-sorted-lists list1 (cdr list2) comp)))))

(defun merge-sort (list comp)
  "Sorts the `list` using the merge sort algorithm and the comparison function `comp`."
  (if (or (null list) (null (cdr list)))
      ; If the list is empty or contains only one element, it is already sorted.
      list
    ; Otherwise, split the list into two halves and sort each half recursively.
    (let* ((middle (/ (length list) 2) ; set middle to be the middle index
           (left (subseq list 0 middle)) ; set left to be the sublist from 0 to middle
           (right (subseq list middle))) ; set right to be the sublist from middle onward
      ;; Recursively sort both halves and then merge them.
      (merge-sorted-lists (merge-sort left comp) (merge-sort right comp) comp)))))
      ; call merge-sorted-lists to sort the two lists into one resulting list



; Quick Sort ==> O(n log n)
; ==> pick an element to be the "pivot". The pivot represents a known value, where
; ==> everything to the left of the pivot will be less than the pivot and
; ==> everything to the right of the pivot will be greater than the pivot
(defun quicksort (vec comp)
; the function takes in two arguments: vec - the vector to be sorted
; comp - an comparison function
  (when (> (length vec) 1)
  ; only continue when the vector has more than one element
    (let ((ppvt 0) ; initialize ppvt to be the partition index, starting at 0
          (pivot (aref vec (1- (length vec)))))
          ; set pivot to be the last element in the vector
      (dotimes (i (1- (length vec)))
      ; loop over all the elements from the start of vec to the second-last index of vec
        (when (funcall comp (aref vec i) pivot)
        ; check the comparison between the element at i and the pivot element
          (rotatef (aref vec i) (aref vec ppvt)) ; swap the two elements
          (incf ppvt))) ; increment ppvt by 1
      (rotatef (aref vec (1- (length vec))) (aref vec ppvt))
      ; Finally, swap the pivot element (`vec[length - 1]`) with `vec[ppvt]`.
      ; This places the pivot element in its correct sorted position within the vector.
      (quicksort (rtl:slice vec 0 ppvt) comp)
      ; Recursively apply `quicksort` to the left partition (all elements less than the pivot).
      ; `rtl:slice` returns a subvector from index 0 to `ppvt - 1`.
      (quicksort (rtl:slice vec (1+ ppvt)) comp)))
      ; Recursively apply `quicksort` to the right partition (all elements greater than the pivot).
      ; `rtl:slice` returns a subvector from `ppvt + 1` to the end of `vec`.
  vec) ; return the sorted vector



; Linked Lists
; ==> nodes that form a list
; ==> one node has to have two items: value and reference
; ==> value - the value/element associated to that node
; ==> reference - a key that points to the next node

; Ex: | | -> |5| | => |13| | -> |27| | -> |53| | -> NIL



; Inserting Elements In LLs ==> O(1)
; ==> to insert new elements you simply change the references of the nodes beside it.

; Ex: Insert |12| | between 5 and 27
; |5| | -> |27| |     ==>     |5| | -> |12| | -> |27| |
; change 5's reference to point to 12
; give 12 a reference to point to 27

; LL's are better with insertions/deletion is O(1)
; while in arrays it is O(n)



; Cons Cells Structure ==> |value|reference|
; ==> each cell contains a value and a reference to another cons cell
; CAR - gives the value of the cell
; CDR - gives the reference to the next cell



; Stacks In LL (LIFO)
; PUSH ==> when adding(pushing) to the stack, create a new node and insert it at the beginning of the existing stack
; POP ==> when removing(popping), make the LL reference point to whatever the first node was pointing to and remove
;         the first node

; Stacks In Arrays (LIFO)
; PUSH ==> when adding(pushing) to the stack, create insert element at the stack index, then increment the index
; POP ==> when removing(popping) from the stack, decrement the index, then delete the element of that position

; Queues In LL (FIFO)
; ENQUEUE ==> when adding to the queue, add to the first node and make the front reference point to whatever it was
;             pointing to.
; DEQUEUE ==> when removing from the queue, remove the last node and make the rear reference point to whatever it
;             was pointing to.

; Queues In Arrays (FIFO)
; ENQUEUE ==> when adding, insert the element at the BACK index and increment the back index
; DEQUEUE ==> when removing, increment the FRONT index and pretend that the value isn't there anymore

; Deque In LL (FIFO/LIFO)
; addBack ==> set the back's next to new node, set new node's prev to back, and set back to new node
; removeBack ==> set back to back's prev, set back's next to NIL, and set back's next to NIL
; addFront ==> set new node's next to FRONT, set front's prev to new node, and set front to new node
; removeFront ==> set front to front's next, set front's prev next to NIL, and set front's prev to NIL

; Deque In Arrays (FIFO/LIFO)
; addFront ==> Front = (front - 1) % length; arr[front] = newValue
; removeFront ==> Front = (Front + 1) % length

; Sets
; ==> cannot have duplicates, unordered, and indexing is not supported
; adjoin ==> if element isn't present, it is added to the head
; member ==> checks if an element is present in the list
; subset ==> set A can be found in set B
; union ==> set A + set B
; intersection ==> set A & set B
; difference ==> set A - set B

; (defvar *m* (1 2 "hello" 4 5 6)) ==> (1 2 "hello" 4  5 6)
; (member 2 *m*) ==> (2 "hello" 4 5 6)
; (member 3 *m*) ==> NIL
; (subsetp '(1 2 4) *m*) ==> T
; (subsetp '(1 2 3) *m*) ==> nil
; (union '(1 2 3) *m*) ==> (1 2 3 "hello" 4 5 6)
; (intersection '(1 2 3) *m*) ==> (1 2)
; (difference '(1 2 3) *m*) ==> (3)
; (adjoin 8 *m*) ==> (8 1 2 "hello" 4 5 6)
; (set-difference '("hi" 7 3 2 1) *m*) ==> (6 5 4 "hello")



; Recursion
; 1. Must have a base case
; 2. Must change its state toward the base case
; 3. Must call itself

; ==> identify the repeated process and determine the smallest amount of work for the recursive call
; ==> the base case is typically an input that doesn't allow the function's behaviour

(defun factorial (x)
  (if (= x 0) ; base case
    (return 1))
  (return (* x (factorial (x - 1))))) ; recursive call

; Tail Recursion
; ==> a function is tail recursive when the last exxecuted statement in the function is the recursive call
; ==> since we can't take the result from the next recursive call and add onto it, we can add inputs to the next call

; &optional
; ==> allows a function to take an optional argument that can be used for the next call