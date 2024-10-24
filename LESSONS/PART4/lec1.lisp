; Part 4 - Lecture 1

; Insertion Sort
(defun insertion-sort (vec comp)
  (dotimes (i (1- (length vec)))
    (do ((j i (1- j)))
        ((minusp j))
      (if (funcall comp (aref vec (1+ j)) (aref vec j))
          (rotatef (aref vec (1+ j)) (aref vec j))
          (return))))
  vec)

; (insertion-sort #(7 8 2 1 3 4) #'<) ==> #(1 2 3 4 7 8)
; (insertion-sort #(7 8 2 1 3 4) #'>) ==> #(8 7 4 3 2 1)

; Quick Sort
(defun quicksort (vec comp)
  (when (> (length vec) 1)
    (let ((ppvt 0)
          (pivot (aref vec (1- (length vec)))))
      (dotimes (i (1- (length vec)))
        (when (funcall comp (aref vec i) pivot)
          (rotatef (aref vec i) (aref vec ppvt))
          (incf ppvt)))
      (rotatef (aref vec (1- (length vec))) (aref vec ppvt))
      (quicksort (rtl:slice vec 0 ppvt) comp)
      (quicksort (rtl:slice vec (1+ ppvt)) comp)))
  vec)

; (quicksort #(7 8 2 1 3 4) #'<) ==> #(1 2 3 4 7 8)
; (quicksort #(7 8 2 1 3 4) #'>) ==> #(8 7 4 3 2 1)
