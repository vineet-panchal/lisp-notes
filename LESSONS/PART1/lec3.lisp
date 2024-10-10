; Week 1 - Lecture 3
; special forms continued and variables

(defun convert-to-letter-grade (numeric-grade)
  "A function that takes in a final score, n, 0 <= n <= 100, and returns the respective grade."
  (case (floor numeric-grade 10)
    (10 "A") (9 "A") (8 "B") (7 "C") (6 "D")
    (otherwise "F")))

(defun mypair (x y msg)
  (case msg
    (sum (+ x y))
    (diff (abs (- x y)))
    (dist (sqrt (+ (* x x) (* y y))))
    (print (pprint x) (pprint y))))

(mypair 3 4 'sum) ; ==> 7
(mypair 4 3 'diff) ; ==> 1
(mypair 3 4 'dist) ; ==> 5.0

; global variables
; use earmuffs (**) when defining global variables
(defvar *upperb*)
(defvar *lowerb*)

(defun guess-my-number ()
  "Returns the integer mean of *upperb* and *lowerb*"
  (ash (+ *upperb* *lowerb*) -1))

(defun smaller ()
  (setf *upperb* (1- (guess-my-number)))
  (guess-my-number))

(defun bigger ()
  (setf *lowerb* (1+ (guess-my-number)))
  (guess-my-number))

; Bank Account Example
; an user may either withdraw or deposit an amount to their account.
; if there is enough balance in the account, the withdrwaw function should return the current balance after the amount is subtracted from the balance
; if there isn't enough balance, then WITHDRAW should output the message "Insufficient Funds" and return the balance unchanged
; there shoudl be a limit of $10000 per withdrawal and negative amounts should not be processed

(defvar *balance* 100)
(defun withdraw (amount)
  (if (>= amount 10000)
      (print "Exceeds maximum withdrawal amount"))
  (if (< *balance* amount)
      (print "Insufficient Funds"))
  (if (and (< amount 10000) (> amount 0))
      (setf *balance* (- *balance* amount)))
  *balance*)
