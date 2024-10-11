; output a list of all even numbers inside of an array in the same order
(defun list-of-evens (arr)
  (let ((result (make-list 0)))
    (dotimes (i (length arr) (reverse result))
      (when (= 0 (mod (aref arr i) 2))
        (setq result (cons (aref arr i) result))
        )
      )

    )

  )
