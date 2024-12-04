; Part 11 - Lecture 1

; Binary Search Trees (BSTs)
; => keys that are less than the parent are found in the left subtree
; => keys that are greater than the parent are found in the right subtree
; Example of a BST:
;        70
;        /\
;      31  93
;     /     /\
;   14    73 94
;  /
; 23

; Benefits of a BST:
; => maintains a sorted collection of objects
; => guarantees O(h), h is the height of the tree, for all main operations: search, insertion, modification, and deletion

; Ex: Draw the BST from the list of keys (68 88 61 89 94 50 4 76 66 82)
;         68
;       /    \
;     61      88
;    /  \    /  \
;   50  66 76    89
;  /         \    \
; 4           82   94

; BST Implementation
(defstruct (node (:conc-name nil))
  key ; object stored in the node
  (lc nil) (rc nil)) ; left and right children of the node

(defun bst-insert (obj bst comp)
"Inserts obj in bst destructively, i.e., modifying the tree"
  (if (null bst) (make-node :key obj)
      (let ((root (key bst))
            (left (lc bst))
            (right (rc bst)))
        (cond ((funcall comp obj root) (setf (lc bst) (bst-insert obj left comp)))
              ((funcall comp root obj) (setf (rc bst) (bst-insert obj right comp)))
              (t bst))
        bst)))

; RTL-USER> (bst-insert 1 nil #'<)
; ==> #S(NODE :KEY 1 :LC NIL :RC NIL)
; RTL-USER> (bst-insert 2 (bst-insert 1 nil #'<) #'<)
; ==> #S(NODE :KEY 1
;             :LC NIL
;             :RC #S(NODE :KEY 2 :LC NIL :RC NIL))

; CL-USER> 
(let ((v nil))
  (dolist (x '(4 1 3 5 2))
    (setf v (bst-insert x v #'<)))
  v)
; ==> #S(NODE
;         :KEY 4
;         :LC #S(NODE
;                 :KEY 1
;                 :LC NIL
;                 :RC #S(NODE :KEY 3 :LC #S(NODE :KEY 2 :LC NIL :RC NIL) :RC NIL))
;         :RC #S(NODE :KEY 5 :LC NIL :RC NIL))



; Ex: Write function BST-FIND that finds an object in a BST. If the item is in the tree, then it returns the root node containing
; object, otherwise it returns NIL.

(defun bst-find1 (obj bst comp)
  (when bst
    (let ((key (key bst)))
      (cond ((funcall comp obj key) (bst-find obj (lc bst) comp))
            ((funcall comp key obj) (bst-find obj (rc bst) comp))
            (t bst)))))

;; A less beautiful implementation of BST-FIND
(defun bst-find2 (obj bst comp)
  (when bst
    (let ((elt (key bst)))
      (if (eql obj elt) bst
        (if (funcall comp obj elt)
            (bst-find obj (lc bst) comp)
            (bst-find obj (rc bst) comp))))))



; Ex: BST-MIN returns a tree whose root node contains the smallest element in the BST. If the BST is empty it returns NIL.
(defun bst-min1 (bst)
  (if (not (null bst))
    (or (bst-min (lc bst)) bst)))

(defun bst-min2 (bst)
  (and bst
    (or (bst-min (lc bst)) bst)))



; Ex: Write function BST-PATH-TO-NODE that, given an object and a BST, returns the path (sequence of nodes) from the BST's
; root to the node containing the object.
(defun bst-path-to-node (obj root comp &optional path)
  (when root
    (let ((key (key root))
            (lc (lc root))
            (rc (rc root))
            (newpath (cons root path)))
      (cond ((funcall comp obj key) (bst-path-to-node obj lc comp newpath))
            ((funcall comp key obj) (bst-path-to-node obj rc comp newpath))
            (t (reverse newpath))))))
