; Practice 3 - Question 10
; Create a function that takes two integers, start and end, and returns a list of integers from start to end (inclusive).
(defun generate-listTR (start end &optional (acc '()))
  (cond ((> start end) (reverse acc))
        (t (generate-listTR (+ 1 start) end (append (list start) acc)))))

(defun generate-listR (start end)
  (let ((result '()))
    (cond ((> start end) (reverse result))
          (t (append (append (list start) result) (generate-listR (+ 1 start) end))))))

(defun generate-listR2 (start end)
  (cond ((> start end) '())
        (t (cons start (generate-listR2 (+ 1 start) end)))))

(defun generate-list (start end)
  (do ((i start (+ 1 i)) (result '()))
      ((> i end) (reverse result))
    (setq result (cons i result))))
