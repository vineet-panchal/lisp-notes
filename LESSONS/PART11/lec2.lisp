; Part 11 - Lecture 2

; BST-REMOVE
; => Removes an item from a BST, i.e., takes an object, a BST, and an ordering function, and returns a BST like the original
; one, but without the object.

; 1. Traverse to the node that needs to be deleted
; 2. Once there, two cases to consider:
;     ▪ The node to be deleted has only one child or no children
;     ▪ The node to be deleted has two children

; Ex: BST-REMOVE 80
;     30                              30
;     /\                              /\
;   15  50                           15 50
;   /\    \       returns:          /\    \
; 10  20   70                     10  20   70
;    /       \                        /
;  17         80                     17

; Ex: BST-REMOVE 50
;     30                                 30
;     /\                                 /\
;   15  50                             15  70
;   /\    \          returns:          /\
; 10 20    70                        10  20
;    /                                   /
;   17                                 17

;     30                                  30
;     / \                                 /\
;   15   50                             15  35
;   /\   /            returns:          /\
; 10 20 35                            10 20
;    /                                   /
;   17                                 17

; Ex: BST-REMOVE 30
; Step 1: Copy key 20, the largest descendant in key 30's left subtree. Analogously, we could've done the same to node with key
; 35, the smallest descendant of the right subtree.
;        30
;      /    \
;    15      70
;   / \      /\
; 10 _20_  35 80
;     /
;    17
; Step 2: BST-REMOVE 20 from key 30's left subtree.
;       30
;     /   \
;   15    70
;   /\    /\
; 10 17 35 80
; Step 3: Paste key 20 replacing key 30.
;       20
;     /   \
;   15    70
;   /\    /\
; 10 17 35 80

(defun bst-remove (obj bst comp)
  (when bst
    (let ((key (key bst))
          (l (lc bst))
          (r (rc bst)))
      (cond ((funcall comp obj key)
             (make-node :key key :lc (bst-remove obj l comp) :rc r))
            ((funcall comp key obj)
             (make-node :key key :lc l :rc (bst-remove obj r comp)))
            (t (bst-join l r comp))))))

(defun bst-join (l r comp)
  "Joins 2 binary search trees. Precondition: (bst-max l) <= (bst-min r)"
  (cond ((null l) r) ; no left subtree
        ((null r) l) ; no right subtree
        ((zerop (random 2)) ;; random choice for new root
         (let ((root (key (bst-max l))))
           (make-node :key root :lc (bst-remove root l comp) :rc r)))
        (t (let ((root (key (bst-min r))))
             (make-node :key root :lc l :rc (bst-remove root r comp))))))



; Splay (BST) Trees
; • Recently accessed elements occur near the root
; • It is a particular kind of "self-balancing" BST, where balanced means recently accessed elements are near the root
; • Insert and lookup operations are O(log n)

; Splaying
; => when a node is accessed, a splay operation is performed on to move it to the root, 
; via a sequence of sub-tree rotations.

; Ex: left-tree rotation (abbreviated as LT-Rot)
;      p              x
;    /  \            /\
;   x   c      ==>  a  p
;  / \                / \
; a  b               b   c
; notice that the binary tree is preserved

; Ex: Splay the node containing 3.
;       9                   9                  _3_          
;      / \                 / \                 / \  
;     7  10              _3_ 10               1  9      
;    / \      LT-Rot     / \       LT-Rot       / \
;  _3_  8     =====>    1   7      =====>      7  10    
;  / \                     / \                / \                       
; 1   4                   4  8               4  8          

; Splay the BST below, splay the node containing node 8.
;         9
;       /   \
;      6    10
;    /   \
;   3    _8_
;  / \   /
; 1  4  7

;          9                    9                  _8_          
;        /   \                 / \                 / \  
;       6    10              _8_ 10               6   9      
;     /   \       RT-Rot     /        RT-Rot     / \   \
;   3     _8_     =====>    6         =====>    3  7   10    
;  / \    /                / \                 / \                       
; 1   4  7                3  7                1  4     
;                        /\
;                       1 4

