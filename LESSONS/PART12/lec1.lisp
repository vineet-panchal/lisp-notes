; Part 12 - Lecture 1

; HEAPS
; => In a queue we have first-in-first-out
; => In a priority queue, dequeueing an item depends on its priority.
; => Highest priority items are dequeued first.

; => using a list and sort functions is not ideal because a list is O(n logn)
; => you can do better with a tree structure called binary heap, allowing us to enqueue and dequeue elements in O(logn)

; Properties of Heaps
; => it is a complete binary tree, each level contains all nodes; not necessarily the bottom level which are completed left to right.
; => in a min-heap(max-heap), for every node x with parent p, the key in p is smaller(greater) than or equal to the key in x

; NOTICE: a heap is not a BST.
;           1
;        /    \
;       2      3
;      / \    / \
;    17  19  36  7
;   /  \
; 25   100

; Heap: Array Representation
; 100
; /\
; 19 36
; /\ /\
; 17 3 25 1
; /\
; 2 7

; Values: | 100 | 19 | 36 | 17 | 3 | 25 | 1 | 2 | 7 |
;  Index:    0    1    2    3    4   5    6   7   8



; HEAP-PUSH (MAX-HEAP)
; => Insert the item at the end of the vector
; => Move it up to preserve heap ordering

; NOTE: (VECTOR-PUSH-EXTEND item array) ==> pushes item at fill-pointer location of the array, resizing if necessary.
(defun heap-push (node vec)
  (vector-push-extend node vec) ; inserts item at fill-pointer position (end of the array)
  (heap-up vec (1- (length vec))))
(defun heap-up (vec i)
  (when (and (> i 0) (> (aref vec i) (aref vec (hparent i))))
    (rotatef (aref vec i) (aref vec (hparent i))) ; swaps child and parent
    (heap-up vec (hparent i))) ; moves item further up
  vec)

; RTL-USER> (setf h (make-array 0 :adjustable t :fill-pointer 0)) ; dynamic array
; ==> #()
; RTL-USER> (heap-push 11 h)
; ==> #(11)
; RTL-USER> (heap-push 19 h)
; ==> #(19 11)
; RTL-USER> (heap-push 9 h)
; ==> #(19 11 9)
; RTL-USER> (heap-push 20 h)
; ==> #(20 19 9 11)

; Ex: Consider the following list of integers: (10 9 8 7 6)
; Draw the binary min heap resulting from inserting these integers in an initial empty heap, starting from 10.

; #(10) | #(10 9) ==> #(9 10) | #(9 10 8) ==> #(8 10 9) | #(8 10 9 7) ==> #(8 7 9 10) ==> #(7 8 9 10)
; #(7 8 9 10 6) ==> #(7 6 9 10 8) ==> #(6 7 9 10 8)



; HEAP-POP
; 1. Remove tree root (first item in the heap)
; 2. Replace it with the last item in the heap array
; 3. Percolate that item down until finding its correct position (preserving heap order)
(defun heap-pop (vec)
  (rotatef (aref vec 0) (aref vec (- (length vec) 1)))
  ;; Unlike PROGN, which returns the result of the last form in its body
  ;; PROG1 returns the result of the first form in its body
  (prog1
      (vector-pop vec) ; pops the item at :fill-pointer and decrements :fill-pointer
    (heap-down vec 0)))
(defun heap-down (vec beg &optional (end (length vec)))
  (let ((l (hlt beg))
        (r (hrt beg)))
    (when (< l end)
      (let ((child ; index of the largest child
              (if (or (>= r end) ; node has only left child
                      (> (aref vec l) (aref vec r)))
                  l
                  r)))
        (when (> (aref vec child) (aref vec beg)) ; keep percolating parent down
          (rotatef (aref vec beg) (aref vec child))
          (heap-down vec child end)))))
  vec)

; HEAP-POP: MAX-HEAP ex:
; CL-USER> (defvar a (make-array 0 :adjustable t :fill-pointer 0))
; ==> A
; CL-USER> a
; ==> #()
; CL-USER> (dolist (i '(20 19 18 7 11 5) a)
;            (vector-push-extend i a))
; ==> #(20 19 18 7 11 5) ; This is a max heap.
; CL-USER> (heap-pop a)
; ==> 20
; CL-USER> a
; ==> #(19 11 18 7 5)
