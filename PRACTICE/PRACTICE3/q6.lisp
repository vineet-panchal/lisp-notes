; Practice 3 - Question 6
; Write a function that takes on integer as an argument.
; Using a do loop, start at 1 and increase by multiples of 3. Each time print out the square of that multiple.
(defun print-squares-of-3s (y)
    (do ((i 1 (* i 3)))
        ((> (* i i) y) i)
        (print (* i i))))

; Write a function that takes one argument, a list of integers.
; Return the average of the list of integers. 
(defun average (lst)
  (let ((sum 0))
    (dolist (curr lst) (/ sum (length lst))
      (setf sum (+ sum curr)))))

; Write a function taht calculates the final price based on the original price and the dicount applied after.
; Original Price < $20 --> 5% discount
; $20 < Original Price <= $100 --> 10% discount
; Original Price > $100 --> 15% discount
; Original Price <= $0 --> "Invalid Price"
(defun discount-calculator (origin)
    (let ((res "Invalid price"))
        (cond ((<= origin 0) (setf res "Invalid Price"))
              ((< origin 20) (setf res (* origin 0.95)))
              ((and (>= origin 20) (<= origin 100)) (setf res (* origin 0.90)))
              (t (setf res (* origin 0.85))))
        res))



; Create a structure called “book” that contains information about the book title (string), author (string), genre (string), and number of pages (integer). 
; Create a function called max-books-pages that takes an array of books as input. The function should output the book with the greatest number of pages.
; Create a function called last-books-author that takes an array of books as input. The function should output the book whose author would come last alphabetically (i.e. Neil Gaiman’s book would be returned instead of John Green’s book if they were the inputs).
(defstruct book
  title author genre pages)

(defun max-books-pages (arr)
  ;; Store first element as the starting max (assuming it is valid)
  (let ((max-book (aref arr 0)))
    (dotimes (i (length arr) max-book) ;; iterate through index values, return max-book
      (if (not (null (aref arr i))) ;; redundant if the array is full
          ;; if current book is greater than the current max, update max
          (if (< (book-pages max-book) (book-pages (aref arr i)))
              (setf max-book (aref arr i)))))))

(defun last-books-author (arr)
  ;; Store first element as the starting max (assuming it is valid)
  (let ((max-book (aref arr 0)))
    (dotimes (i (length arr) max-book) ;; iterate through index values, return max-book
      (if (not (null (aref arr i)))
          ;; if current book is greater than the current max, update max
          (if (string< (book-author max-book) (book-author (aref arr i)))
              (setf max-book (aref arr i)))))))



; Create a structure called “book” that contains information about the book title (string), author (string), genre (string), and number of pages (integer). 
; Create a function called max-books that takes an array of books and a function (f) as input. f is used to compare books, taking 2 book objects as input and returning t if the first element is “less than” the second element, and nil otherwise. max-books returns the book object that is considered greatest by f. This question is essentially the same as the previous question, but this function has the flexibility to compare objects in multiple ways.
; What would a function call to max-books look like to get the book with the most pages? with the least pages? the book whose author comes first alphabetically? The mystery book furthest back in the array?
(defstruct book
  title author genre pages)

(defun max-books (arr f) ;; f is a given function, likely a lambda function
  (let ((max-book (aref arr 0))) ;; set max-book to first element (assuming its valid)
    (dotimes (i (length arr) max-book) ;; iterate through the index values, return max
      (if (not (null (aref arr i)))
          (if (funcall f max-book (aref arr i)) ;; if function determines this is the new max
              (setf max-book (aref arr i))))))) ;; update the current max



; A database is being created to keep track of students in the CS program. This database should include each student’s year of study (1, 2, 3, or 4), and the grades they have received on each of their lab assignments. Using this database, we can determine how well students are doing overall in their studies based on the year they are in.
; Create a structure called “student” that contains their year of study (1, 2, 3, or 4) and a list of their lab grades with values ranging from 0 - 100 inclusive.
; Create a function called “count-above” that takes a student, an integer representing the year of study, and an integer representing a grade threshold as inputs. If the student is not in the given year of study, return 0, otherwise return the number of grades that are greater than or equal to the grade threshold.
; Create a function called “students-above” that takes an array of students, an integer representing the year of study, and an integer representing a grade threshold as inputs. Using the count-above function created above, return the total number of grades greater than or equal to the grade threshold fulfilled by students only in the given year of study.

; Given an array s containing the following student lab grades:
; Student 1: (88 23 45 77 78 76 10)
; Student 2: (88 23 45 29 76)
; Student 3: (40 55 36 67 70 95 45 82 42 11)
; Student 4: (66 76 56 59 60 47 39)
(defstruct student
  level grades)

(defun count-above (stud year thresh)
  ;; check year of study
  (if (not (equal year (student-level stud))) 0
      (let ((total 0))
        (dolist (grade (student-grades stud) total)
         ;; increment for every grade meeting threshold
          (if (>= grade thresh) (setf total (1+ total)))))))

(defun students-above (studs year thresh)
  ;; runs count-above on every student in the array, adds the results
  (let ((total 0))
    (dotimes (i (length studs) total)
      (setf total (+ total (count-above (aref studs i) year thresh))))))



; In highly classified scenarios, information is often redacted to maintain secrecy. In this problem, you will remove any reference to the names of specified individuals.
; Create a “person” structure, where each person has a first name, mother’s name, father’s name, and sibling’s name, all represented by strings. In some cases, a person doesn’t have a family member, so their name is nil instead.
; Create a function called “redact-names” which takes a list of person objects and a string representing a name as input. Given the list and the name, remove any instance of the name in all the person objects and return the updated list. Assume you only need to remove perfect matches - not partial matches of the strings. To redact a name, replace the name with “___” instead of the original name.
; Sample Database:
; (First name, Mother’s name, Father’s name, Sibling’s name)
; Bart		Marge		Homer	Lisa
; Paul		John		George	Ringo
; Roger		Lisa		John		Paul
; Lisa		Stacy				
(defstruct person
  first mother father sibling)

;; function to quickly generate a list with the given personnel for testing
(defun make-person-list ()
  (list (make-person :first "Bart"  :mother "Marge" :father "Homer"  :sibling "Lisa")
        (make-person :first "Paul"  :mother "John"  :father "George" :sibling "Ringo")
        (make-person :first "Roger" :mother "Lisa"  :father "John"   :sibling "Paul")
        (make-person :first "Lisa" :mother "Stacy")))

(defun redact-names (people name)
  ;; Iterate through each person
  (dolist (p people people)
    ;; Check each person, redact if matching attribute
    (if (string= (person-first p) name) (setf (person-first p) "___"))
    (if (string= (person-mother p) name) (setf (person-mother p) "___"))
    (if (string= (person-father p) name) (setf (person-father p) "___"))
    (if (string= (person-sibling p) name) (setf (person-sibling p) "___"))))



; Create a function called “array-stats” that takes one argument, an array of integers. We want to return a list with 5 values in this order: minimum value, maximum value, average, sum, and median. You can assume the array elements are not nil and the array’s length is greater than 0.
; NOTE: For the median, you can create a helper function using a sorting algorithm or you can use the built-in sort function. If the length of the array is even, take the average of the two elements in the middle of the array. Otherwise, the median will be the middle element.
(defun array-stats (arr)
  (let ((stats '()) (mini (aref arr 0)) (maxi (aref arr 0)) (average 0) (sum 0) (median (aref arr 0)))
    (dotimes (i (length arr))
      ;; Finds the min and max and accumulates the sum
      (when (< (aref arr i) mini)
        (setf mini (aref arr i)))
      (when (> (aref arr i) maxi)
        (setf maxi (aref arr i)))
      (setf sum (+ sum (aref arr i))))

    ;; Uses sum to find the average and sorts the array from least to greatest (destructive)
    (setf average (/ sum (length arr)))
    (setf arr (sort arr #'<))

    ;; If it's even, we get the average of the middle two elements
    (if (oddp (length arr))
        (setf median (aref arr (floor (length arr) 2)))
        (setf median (/ (+ (aref arr (floor (length arr) 2)) (aref arr (1- (floor (length arr) 2)))) 2)))
    
    ;; Creates a list with the statistics that we return
    (setf stats (list mini maxi average sum median))))