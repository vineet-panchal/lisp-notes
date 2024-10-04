(defvar *max-capacity-1* 0)
(defvar *max-capacity-2* 0)
(defvar *occupied-spots-1* 0)
(defvar *occupied-spots-2* 0)

(defun max-capacity (b n)
  (cond
    ((= b 1) (setf *occupied-spots-1* 0)
     (setf *max-capacity-1* n))
    ((= b 2) (setf *occupied-spots-2* 0)
     (setf *max-capacity-2* n)))
  n)

(defun enter-garage (b)
  (cond
    ((= b 1)
     (when (< *occupied-spots-1* *max-capacity-1*)
       (incf *occupied-spots-1*))
     (- *max-capacity-1* *occupied-spots-1*))
    ((= b 2)
     (when (< *occupied-spots-2* *max-capacity-2*)
       (incf *occupied-spots-2*))
     (- *max-capacity-2* *occupied-spots-2*))))

(defun exit-garage (b)
  (cond
    ((= b 1)
     (when (> *occupied-spots-1* 0)
       (decf *occupied-spots-1*))
     (- *max-capacity-1* *occupied-spots-1*))
    ((= b 2)
     (when (> *occupied-spots-2* 0)
       (decf *occupied-spots-2*))
     (- *max-capacity-2* *occupied-spots-2*))))
