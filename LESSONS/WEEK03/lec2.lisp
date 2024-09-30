; Week 3 - Lecture 2
; structures, constructors, accessors, arrays


(defstruct movie title director year type) ; ==> MOVIE

; (let ((amovie
;       (make-movie :title "Blade Runner" :director "Ridley Scott")))
;    (setf (movie-year amovie) 1982)
;    (values (movie-title amovie) (movie-director amovie) (movie-year amovie)))
; ==> "Blade Runner"
; ==> "Ridley Scott"
; ==> 1982

; MAKE-ARRAY special form
#(3 4 5 6) ; an array in lisp ==> #(3 4 5 6)
(make-array 3) ; create an array with size 3 ==> #(0 0 0)
(make-array 3 :initial-element 1/2) ; create an array with size 3 and all elements are 1/2 ==> #(1/2 1/2 1/2)

; Ex: create a movie database using a structure and an array
(defparameter *size* 10) ; size of the database
(defvar *db*)
(setf *db* (make-array *size* :initial-element nil))
(defun add-movie (m)
  "Adds a movie to the database and returns true. Otherwise, returns NIL"
  (dotimes (i *size*)
    (unless (aref *db* i)
      (setf (aref *db* i) m)
      (return t))))

(add-movie (make-movie :title "Blade Runner")) ; add Blade Runner to the array ==> T
(aref *db* 0) ; ==> get value of array at 0 ==> #S(MOVIE :TITLE "Blade Runner" :DIRECTOR NIL :YEAR NIL :TYPE NIL)
(add-movie (make-movie :title "The Big Lebowsky")) ; add The Big Lebowsky to the array ==> T
*db* ; ==> #(#S(MOVIE :TITLE "Blade Runner" :DIRECTOR NIL :YEAR NIL :TYPE NIL)
; #S(MOVIE :TITLE "The Big Lebowsky" :DIRECTOR NIL :YEAR NIL :TYPE NIL) NIL NIL NIL NIL NIL NIL NIL NIL)

; Ex: Create a function that returns the movies in the db, otherwise return NIL
(defun in-db? (title)
  (dotimes (i *size*)
    (when (and (typep (aref *db* i) 'movie)
               (equal (movie-title (aref *db* i)) title))
      (return (aref *db* i)))))

(in-db? "Blade Runner") ; ==> #S(MOVIE :TITLE "Blade Runner" :DIRECTOR NIL :YEAR NIL :TYPE NIL)
(in-db? "The Dark Knight") ; ==> NIL
