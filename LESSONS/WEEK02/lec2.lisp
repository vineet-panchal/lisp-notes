; Week 2 - Lecture 2
; more looping special forms

; DO and DO* special forms

; Ex: make a function to count the number of a specific character in a string
; (count-char #\a "abba")

(defun count-chars (c s)
  "Returns the count of characters that are equal to character c in string s"
  (let ((acc 0))
    (dotimes (i (length s) acc)
      (when (char= (aref s i) c)
        (incf acc))))) ; equivalent to (setf acc (+ 1 acc))

(defun vowelp (c)
  "Returns true if c is a character representing a vowel"
  (or (char= c #\a)
      (char= c #\e)
      (char= c #\i)
      (char= c #\o)
      (char= c #\u)))

; Ex: given the definition of vowelp, write the definition of consonantp.

(defun consonantp (c)
  (and (not (vowelp c))
       (or (and (char>= c #\a) (char<= c #\z))
           (and (char>= c #\A) (char<= c #\Z)))))

; Ex: write a function that returns the number of vowels and consonants of a string, in that order

(defun count-vc (s)
  (do ((i 0 (1+ i))
       (accv 0)
       (accc 0))
      ((equal i (length s)) (values accv accc))
    (if (vowelp (aref s i)) (incf accv)
        (if (consonantp (aref s i)) (incf accc)))))
