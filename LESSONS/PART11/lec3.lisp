; Part 11 - Lecture 3
(defstruct (node (:conc-name nil)
                 (:print-object
                  (lambda (node out)
                    (format out "[~a-~@[~a~]-~@[~a~]]" ; ] prints argument if non-NIL
                            (key node)
                            (lc node)
                            (rc node)))))
  key ; for storing the key
  lc ; left child
  rc) ; right child

; RTL-USER> (make-node :key 4)
; ==> [4--]
; RTL-USER> (make-node :key 4 :lc (make-node :key 2))
; ==> [4-[2--]-]
; RTL-USER> (key (lc (make-node :key 4 :lc (make-node :key 2))))
; ==> 2
; RTL-USER> (make-node :key 4 :lc (make-node :key 2) :rc (make-node :key 5))
; ==> [4-[2--]-[5--]]

; Ex: Write a function called ST-SEARCH that finds an item in the tree.
; If the item is in the tree, it splays the node containing the item and returns the new tree.

; ST-SEARCH item 7 on the tree
;        9                       7   
;       / \                     / \  
;      6   10                  6   9 
;    /   \       returns:     /   / \ 
;   3     8                  3   8   10  
;  / \   /                  / \ 
; 1   4 7                  1   4

(defun tree-rotate (node parent grandparent)
  (cond                              ; update structure of parent node
    ((eql node (lc parent)) (setf (lc parent) (rc node) ; EQL compares pointers
                                  (rc node) parent))
    ((eql node (rc parent)) (setf (rc parent) (lc node)
                                  (lc node) parent))
    (t (error "NODE (~A) is not the child of PARENT (~A)"
              node parent)))
  (cond                          ; upate structure of grandparent node
    ((null grandparent) node)
    ((eql parent (lc grandparent)) (setf (lc grandparent) node))
    ((eql parent (rc grandparent)) (setf (rc grandparent) node))
    (t (error "PARENT (~A) is not the child of GRANDPARENT (~A)"
              parent grandparent))))
; 6 6
; / \ LT-Rot / \
; 4 8 ==> 1 8
; / \ / / \ /
; 1 5 7 0 4 7
; / \ / \
; 0 2 2 5

(defun node-chain (item root &optional chain)
"Returns the node containing ITEM (if found) and the chain of nodes leading to it."
  (if root
    (let ((key (key root))
          (lc (lc root))
          (rc (rc root))
          (chain (cons root chain)))
      (cond ((< item key) (node-chain item lc chain))
            ((> item key) (node-chain item rc chain))
            (t (values root chain))))
    (values nil chain)))

; Ex: Suppose V is the root of the tree below.
;        9
;       / \
;      6   10
;    /   \
;   3     8
;  / \   /
; 1   4 7
; RTL-USER> (node-chain 8 v)
; ==> [8-[7--]-]
;    ([8-[7--]-] [6-[3-[1--]-[4--]]-[8-[7--]-]] [9-[6-[3-[1--]-[4--]]-[8-[7--]-]]-[10--]])

(defun splay (node chain)
  (loop :for (parent grandparent) :on chain :do
    (tree-rotate node parent grandparent))
  node)

; LOOP examples
; RTL-USER> (loop :for x :in '(1 2 3 4) :do (format t "~a " x))
; ==> 1 2 3 4
; RTL-USER>
; (loop :for (a b) :on '(1 2 3 4 5 6 7) ; NOTICE: ON not IN
;       :do (format t "<~a ~a> " a b))
; <1 2> <2 3> <3 4> <4 5> <5 6> <6 7> <7 NIL>

(defun st-search (item root)
  (multiple-value-bind (node chain) (node-chain item root)
    (when node (splay (car chain) (cdr chain)))))
 

