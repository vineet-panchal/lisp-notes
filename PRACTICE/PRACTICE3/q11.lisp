; Practice 3 - Question 11
; Write a function that takes a start index, and an end index. It should return a new list with all the elements
; starting at the start index (inclusive) with the end index (exclusive) from the given list.
(defun list-sliceTR (lst start end &optional (acc '()))
  (cond ((= start end) (reverse acc))
        (t (list-sliceTR lst (+ start 1) end (append (list (nth start lst)) acc)))))

(defun list-sliceR (lst start end)
  (let ((result '()))
    (cond ((= start end) (reverse result))
          (t (append (append (list (nth start lst)) result) (list-sliceR lst (+ start 1) end))))))

(defun list-sliceR2 (lst start end)
  (cond ((= start end) '())
        (t (cons (nth start lst) (list-sliceR2 lst (+ start 1) end)))))

(defun list-slice (lst start end)
  (do ((i start (+ i 1)) (result '()))
      ((= i end) (reverse result))
    (setq result (append (list (nth i lst)) result))))
