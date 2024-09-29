; Week 2 - Lecture 1
; recursion, loops, and more special forms

(defun factorial (x)
  (if (<= x 1) 1
      (* x (factorial (- x 1)))))

; DOTIMES special form

(dotimes (i 4 "done")
  (print i))

(dotimes (i 6)
  (if (= i 3)
      (return)
      (print i)))

(dotimes (i 6)
  (if (= i 3)
      (return "exited")
      (print i)))

; CHAR, CHAR-CODE, and CODE-CHAR special forms and AREF accessor

(defun cpt-char (c)
  (if (and (char>= c #\a) (char<= c #\z))
      (code-char (- (char-code c) 32)) c))
(defun capitalize (s)
  "Capatilizes the characters in string s"
  (dotimes (i (length s) s)
    (setf (aref s i) (cpt-char (aref s i)))))

(defun vowelp (c)
  "Returns true if c is a character representing a vowel"
  (or (char= c #\a) (char= c #\e) (char= c #\i) (char= c #\o) (char= c #\u)))
(defun cpt-vowels (s)
  "Capitalizes all the vowels in string s"
  (dotimes (i (length s) s)
    (when (vowelp (aref s i))
      (setf (aref s i) (cpt-char (aref s i))))))
