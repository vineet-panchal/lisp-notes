; Review 2 Practice - Question 1
; Determine the running time T(n) and time complexity of each code sample.

; 1.a)
(defun question-1 (n)
  (let ((total 0) (sumDiffs 0))
    (dotimes (b (- n 2))
      (let ((q (* b 2)) (r (* b 3)))
        (setf total (+ total q r))
        (setf sumDiffs (+ sumDiffs (- q r)))
        ))
    (setf total (+ total 0))))

; T(n) = 2(let) + {(n - 2) - 1 | b = 0} ∑ (2(let) + 1(setf) + 1(setf)) + 1(setf)
; T(n) = 3 + {(n - 2) - 1 | b = 0} ∑ (4)
; T(n) = (n - 2)(4) + 3 = 4n - 5
; Time Complexity = O(n)

; 1.b)
(defun question-2 (n)
  (let ((result 0))
    (dotimes (a n result)
      (dotimes (b n)
        (dotimes (c b)
          (dotimes (d n)
            (setf result (+ result 1))))))))

; T(n) = 1(let) + {n - 1 | a = 0} ∑ ({n - 1 | b = 0} ∑ ({b - 1 | c = 0} ∑ ({n - 1 | d = 0} ∑ (1(setf)))))
; T(n) = 1(let) + {n - 1 | a = 0} ∑ ({n - 1 | b = 0} ∑ ({b - 1 | c = 0} ∑ (n)
; T(n) = 1(let) + {n - 1 | a = 0} ∑ ({n - 1 | b = 0} ∑ (bn)
; T(n) = 1(let) + {n - 1 | a = 0} ∑ ( ((n - 1)n) / 2 ) n
; T(n) = 1 + n * (((n - 1) * n) / 2) * n
; T(n) = 1 + ((n^4 - n^3) / 2) = 1 + 1/2n^4 - 1/2n^3
; Time Complexity = O(n^4)

; 1.c)
(defun question-3 (n)
  (let ((a (/ n 2)) (total 0))
    (do (x a (- x 1))
        ((<= x 0) total)
      (setf total (+ total 1)))))

; T(n) = 2(let) + {n/2 - 1 | x = 0} ∑ (1(setf))
; T(n) = 2 + (n/2)(1) = 2 + n/2
; Time Complexity = O(n)
