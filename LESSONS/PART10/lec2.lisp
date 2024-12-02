; Part 10 - Lecture 2

; Tree Traversal => trees can be traversed in multiple ways

; Depth First Search Pre-Order (DFS)
; 1. If the current node is empty then return.
; 2. Execute the following three operations:
;     ◦ Visit the current node.
;     ◦ Recursively traverse the current node's left subtree.
;     ◦ Recursively traverse the current node's right subtree.

;; DFS PRE-ORDER: visit root then visit children
(defun pre-dfs (fn root)
  (when root
    (funcall fn (key root))
    (dolist (child (children root))
      (pre-dfs fn child))))

;       *
;     /  \ 
;   c     +
;  / \   / \
; f  a  d  e
; RTL-USER> (pre-dfs 'princ *tree*)
; *cfa+de



; Depth First Search Post-Order (DFS)
; 1. If the current node is empty then return.
; 2. Execute the following three operations:
;     ◦ Recursively traverse the current node's left subtree.
;     ◦ Recursively traverse the current node's right subtree.
;     ◦ Visit the current node.

; DFS POST-ORDER: vist children then visit root
(defun post-dfs (fn node)
  (dolist (child (children node))
    (post-dfs fn child))
  (funcall fn (key node)))

;     *
;    / \
;   c   +
;  /   / \
; f   d  e
; RTL-USER> (post-dfs 'princ *tree*)
; fcde+*



; Breadth First Search (BFS) or "level order"
(defun bfs (fn nodes)
  (let ((next-level ()))
    (dolist (node (rtl:mklist nodes)) ; mklist: (if (listp nodes) nodes (list nodes))
      (funcall fn (key node))
      (dolist (child (children node))
        (push child next-level)))
    (when next-level
      (bfs fn (reverse next-level)))))

;     *
;    / \
;   c   +
;  /   / \
; f   d  e
; RTL-USER> (bfs 'princ *tree*)
; *c+fde



; Ex: Given the tree node data structure definition below, 
; write function COUNT-ELEM that counts the data items in a tree.
(defstruct (t-node (:conc-name nil))
  key
  children) ; a list of branches
; What type of tree traversal you will need to implement to solve this problem?

(defun count-elem (e &optional (acc 0))
  (cond ((null e) acc)
        ((listp e) (count-elem (cdr e) (+ acc (count-elem (car e) 0))))
        (t (count-elem (children e) (1+ acc)))))

(defun count-elem (node)
  (if (null node) 0
    (let ((acc 1))
      (dolist (p (children node) acc)
        (setf acc (+ (count-elem p) acc))))))

; Depth-first traversal. Notice that in the recursive call the search tree is deepened as much as 
; possible before going to the next sibling



; In a binary tree representing mathetical expressions, the leaf nodes contain numbers and the internal nodes contain one of
; the following symbols: , , , or . Below are examples of valid binary trees of this kind:
;      +       *
;     / \     / \
;    *  6    4  -
;  /  \        / \
; 2  3.4      3  9
(defstruct (bt-node (:conc-name nil))
  key
  (lc nil) (rc nil))

; Ex: write a function called VERIF-TREE that returns T if the given binary is valid (according to the above rules); otherwise it
; returns NIL.
; What type of tree traversal you will need to implement to solve this problem?

(defun verif-tree (tree)
  (cond ((null tree) tree)
        ((member (key tree) '(+ - / *)) (and (verif-tree (lc tree))
                                            (verif-tree (rc tree))))
        ((numberp (key tree)) (and (null (lc tree))
                                    (null (rc tree))))))
; Depth-first traversal. Notice that in the recursive call the search tree is deepened as much as possible before going to the next
; sibling.
