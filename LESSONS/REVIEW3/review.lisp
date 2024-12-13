; Part 8 - 13 Review

; QUICKSORT
; ==> O(n log n)
; ==> pick an element to be the "pivot". The pivot represents a known value, where
; ==> everything to the left of the pivot will be less than the pivot and
; ==> everything to the right of the pivot will be greater than the pivot
(defun quicksort (vec comp)
; the function takes in two arguments: vec - the vector to be sorted
; comp - an comparison function
  (when (> (length vec) 1)
  ; only continue when the vector has more than one element
    (let ((ppvt 0) ; initialize ppvt to be the partition index, starting at 0
          (pivot (aref vec (1- (length vec)))))
          ; set pivot to be the last element in the vector
      (dotimes (i (1- (length vec)))
      ; loop over all the elements from the start of vec to the second-last index of vec
        (when (funcall comp (aref vec i) pivot)
        ; check the comparison between the element at i and the pivot element
          (rotatef (aref vec i) (aref vec ppvt)) ; swap the two elements
          (incf ppvt))) ; increment ppvt by 1
      (rotatef (aref vec (1- (length vec))) (aref vec ppvt))
      ; Finally, swap the pivot element (`vec[length - 1]`) with `vec[ppvt]`.
      ; This places the pivot element in its correct sorted position within the vector.
      (quicksort (rtl:slice vec 0 ppvt) comp)
      ; Recursively apply `quicksort` to the left partition (all elements less than the pivot).
      ; `rtl:slice` returns a subvector from index 0 to `ppvt - 1`.
      (quicksort (rtl:slice vec (1+ ppvt)) comp)))
      ; Recursively apply `quicksort` to the right partition (all elements greater than the pivot).
      ; `rtl:slice` returns a subvector from `ppvt + 1` to the end of `vec`.
  vec) ; return the sorted vector





; HASH TABLES & KEY-VALUE PAIRS

; Arrays
; => data structure with a fixed size. Integer index values. Very restrictive. 

; Association-Lists or A-Lists
; => list of cons pairs. Dynamic structure. Rather than using index values, look at the car of each element.
; Ex: (defvar alist '((0 . "Zero")(1 . "One")(2 . "Two")(3 . "Three")))
; => these pairs refer to two values.
; => car would give the first element and cdr would give the second element.

; A-List: Search ==> O(n), not ordered so we need to check everything
; Ex: (assoc 3 *words*) ==> (3 . "Three")

; A-List: Add ==> O(1), don't care about the order
; Ex: (push '(4 . "Four") *words*) or cons to add to the rest of the list

; A-List: Remove
; Ex: (remove 3 *words* :key 'car)

; Hash Tables
; => hash tables maintain a database of keys and values.
; => hash tables have a fixed amount of memory allocated to maintaining its structure.
; => it has keys, values, and a backing array.
; => instead of indexing for elements, we use a hash function to tell us where the pair should go in our table.

; Ex:
; Position:            0            1            2            3            4            5   
;      Key:                                     78          133                        12
;    Value:                                    "A"          "X"                       "G"
;                                       (78 . "A")  (133 . "X")                (12 . "G")

; Hash Function
; => Given any key, the function returns an integer index that oyu could expect the key-value pair to be mapped to.

; Key - k
; Hash Function - h
; Index - h(k)

; Simplest Hash Function
; h(k) = k % (# of positions in the table)
; h(k) = k % N

; => hash tables have a fixed size, and every key is mapped to one specific place in the hash table.
; => however, multiple keys can (and will) map to that same position, causing collisions.

; Chaining
; => If more than one elements get mapped to the same index, then we chain them in a linked list
; => the problem with chaining is that it takes more overhead work to go through the elements of a linked list.

; Linear Probing
; => the process of resolving collisions where we keep checking the next place where a pair could exits in the table.

; Ex: Place (11 . "Eleven") (1 . "One") (4 . "Four") (5 . "Five") into a hash table with 7 positons using chaining and linear probing.
; (11 . "Eleven") ==> 11 % 7 = 4 => 3
; (1 . "One") ==> 1 % 7 = 1
; (4 . "Four") ==> 4 % 7 = 4
; (5 . "Five") ==> 5 % 7 = 5

;     Chaining                                         Linear Probing
; Index    Contents                                 Index       Contents
; 0                                                 0            
; 1        (1 . "One")                              1           (1 . "One")
; 2                                                 2 
; 3                                                 3
; 4        (11 . "Eleven") --> (4 . "Four")         4           (11 . "Eleven")
; 5        (5 . "Five")                             5           (4 . "Four")
; 6                                                 6           (5 . "Five")

; => in chaining, (11 . "Eleven") and (4 . "Four") are chained together in a linked list at position 4
;    because they both map to position 4 using the hash function

; => in linear probing, (11 . "Eleven") and (4 . "Four") are both mapped to position 4.
;    --> Since position 4 is already occupied by (11 . "Eleven"), (4 . "Four") is mapped to the next avaliable spot going down
;        in the hash table. In this case that would be position 5.
;    --> (5 . "Five") would map to position 5 using the hash function, however, position 5 is already occupied by (4 . "Four").
;        Therefore, it will be mapped to the next avaliable spot in the hash table which is position 6

; Linear Insertion/Adding Elements With Linear Probing
; => when adding new element, use hash function to find out where to put the new pair.
;    --> if unoccupied, insert it at the given position
;    --> if occupied, move to the next position and try there

; Linear Probing's Auxiliary Hash Function
; h(k, i) = (h'(k) + i) mod M, where i is the iteration/probe number

; Ex: Map 2, 10, and 18 in a hash table with 8 slots using the auxiliary hash function.
; h(2, 0) = (2 + 0) Mod 8 = 2    ==> 2 is mapped to position 2 on the hash table
; h(10, 0) = (10 + 0) Mod 8 = 2  x=> 10 cannot be mapped to position 2, as it is already taken 
; h(10, 1) = (10 + 1) Mod 8 = 3  ==> 10 is mapped to position 3 on the hash table
; h(18, 0) = (18 + 0) Mod 8 = 2  x=> 18 cannot be mapped to position 2, as it is already taken
; h(18, 1) = (18 + 1) Mod 8 = 3  x=> 18 cannot be mapped to position 3, as it is already taken
; h(18, 2) = (18 + 2) Mod 8 = 4  ==> 18 is mapped to position 4 on the hash table

; Index:   0   1   2   3   4   5   6   7
;   Key:           2  10  18

; **Linear Probing is bound to clustering**

; Clustering
; => potential to build up a lot consecutive keys in the hash table
; => may lead to multiple iteration/probe attempts to find out if key exists.

; Ex: Consider the hash table below
; Index:   0   1   2   3   4   5   6   7
;   Key:       a   b   c   d   e
; => if f was hashed to 1, we would need to search 6 positions before finding a position to map it to.

; => With linear probing, clustering builds up when more than one element is hashed to the same position.
; => the hash table becomes piled up in one section, while another section is empty
; => we want clustering to be more spread out throughout the hash table

; Quadratic Probing
; => same as linear, however the auxiliary hash function has i^2 to help distribute keys

; Quadratic Probing's Auxiliary Hash Function
; h(k, i) = (h'(k) + i + i^2) mod M, where i is the iteration/probe number

; Ex: Map 2, 10, and 18 in a hash table with 8 slots using the auxiliary hash function.
; h(2, 0) = (2 + 0 + 0) Mod 8 = 2    ==> 2 is mapped to position 2 on the hash table
; h(10, 0) = (10 + 0 + 0) Mod 8 = 2  x=> 10 cannot be mapped to position 2, as it is already taken
; h(10, 1) = (10 + 1 + 1) Mod 8 = 4  ==> 10 is mapped to position 4 on the hash table
; h(18, 0) = (18 + 0 + 0) Mod 8 = 2  x=> 18 cannot be mapped to position 2, as it is already taken
; h(18, 1) = (18 + 1 + 1) Mod 8 = 4  x=> 18 cannot be mapped to position 4, as it is already taken
; h(18, 2) = (18 + 2 + 4) Mod 8 = 0  ==> 18 is mapped to position 0 on the hash table

; Index:   0   1   2   3   4   5   6   7
;   Key:  18       2      10

; => quadratic probing is not guaranteed to reduce collisions, but has a greater distribution with the goal of reducing collisions.

; Removing Elements In A Hash Table
; => we can't just remove an element from the hash table because other elements may rely on an element being there for linear probing.
; => instead of making the element NIL, we set it to DELETED.
;    --> this way wwe know that there used to be an element here, but not anymore
;    --> could overwrite it when adding a new element

; Implementing Hash Tables
; MAKE-HASH-TABLE ==> creates hash table
; GETHASH ==> look up item
; SETF and GETHASH ==> store an item
; REMHASH ==> remove a key
; INSPECT ==> inspect hash table
; MAPHASH ==> perform action on each key-value pair in the hash table





; TREES

; Basic Tree
; => trees are made of nodes
; => each node contains a value and a reference (list) to nodes below it
; => nodes cannot exist in multiple branches (branches do not overlap)
; => a node is considered a leaf if it has no nodes below it in the branch

; Example of a tree:
;            Head/Root Node
;            /            \
;         NodeA          NodeB
;        /     \        /     \
;     NodeA1  NodeA2  NodeB1 NodeB2
;    /      \
; NodeAX  NodeAY

(defstruct (tree-node (:conc-name nil))
  key ; the value of the node
  children) ; list of children nodes

; Searching General Tree, Tail-Recursive solution
(defun search-tree (e node &optional (found nil)) ; target, current node, return T/F
  (cond ((null node) found) ; if end of branch, return found
        (found e) ; if already found, return value
        ((listp node) (search-tree e (cdr node) (search-tree e (car node))))
        ((equal e (key node)) e)
        (t (search-tree e (children node)))))

; Searching General Tree, Iterative/Recursive solution
(defun search-treeIt (e node)
  (when node ; if node exists
    (if (equal e (key node)) e ; if found, return the value (True)
        (dolist (b (children node)) ; for each element in the children
          (let ((res (search-treeIt e b))) ; recursively call on each child
            (when res (return res))))))) ; if one of the children is the target, we found it

; General Tree Traversal

; Depth-First Search (DFS)
; => fully process a node and its children before moving back up to explore another branch

; Pre-Order: Current, All Children
; In-Order: Left, Current, Right (Only for BST)
; Post-Order: All Children, Current

; Ex: Consider the tree:
;       A
;    /  |  \ 
;   B   E   G
;  / \  |
; C   D F
; Pre-Order: ABCDEFG
; Post-Order: CDBFEGA

; Ex: Consider the binary tree:
;     A
;    / \
;   B   G
;  / \
; C   D
; In-Order: CBDAG

; Breadth-First Search (Level Order)
; => Visit every node on a level before going to the next level
; => need a system to be able to keep track of every node that should be included in the lower level

; Ex: Consider the tree:
;       A
;    /  |  \
;   B   E   G
;  / \  |
; C   D F
; BFS Level-Order: ABEGCDF





; Binary Search Trees
; => similar to a tree, except instead of having children, it has a left child and a right child
; => elements to the left are considered "less than" the current element, while elements to the right are "greater than" the current element

; Example of a binary tree:
;     35
;    /  \
;   10  37    ; 10 is less than 35 and 37 is greater than 35
;  /  \   \
; 8   11  99  ; 8 is less than 10, 11 is greater than 10, and 99 is greater than 37

(defstruct (bNode (:conc-name nil))
  key ; the value of the node
  (lc nil) ; left child node
  (rc nil)) ; right child node

; Why Use Binary Trees?
; => objects are sorted within the tree, rigid structure compared to a general tree with multiple children
; => O(logn) for search, insertion, modification, and deletion
; => Dynamic, we could use an array for binary search, but fixed size

; Insertion In Binary Trees
(defun bst-insert (obj bst comp)
 "Inserts obj in bst destructively, i.e., modifying the tree"
  (if (null bst) (make-bNode :key obj) ; if binary tree is null, create new tree with the root being the object
      (let ((root (key bst)) ; let root be the parent node
            (left (lc bst)) ; let left be the left child node
            (right (rc bst))) ; let right be the right child node
        (cond ((funcall comp obj root) (setf (lc bst) (bst-insert obj left comp)))
              ; if obj compares with root, set the left child to be the recursive call of obj left binary tree and comp
              ((funcall comp root obj) (setf (rc bst) (bst-insert obj right comp)))
              ; if root compares with obj, set the right child to be the recursive call of obj right binary tree and comp
              (t bst)) ; else return the binary tree
        bst))) ; return binary tree

; (defvar myTree nil)
; (setf myTree (bst-insert myTree 5 #'<))
; (setf myTree (bst-insert myTree 1 #'<))
; (setf myTree (bst-insert myTree 3 #'<))
;    5
;   / \
;  1
; / \
;    3

; Finding Elements In Binary Trees
(defun bst-find (val node)
  (cond ((null node) nil) ; if the binary tree is null, return nil
        ((eq val (key node)) node) ; if val and the key of the node is equal, return the tree
        ((< val (key node)) (bst-find val (lc node))) ; if val is less than the key, recursively call the val and the left child
        (t (bst-find val (rc node))))) ; else if val is greater than the key, recursively call the val and the right child

; Removing Elements In Binary Trees
; => removal involves rearranging the tree
; => take the next greatest element that is less than our value (or smallest element that is greater than our value) and put it
;    where the current node is

(defun bst-remove (obj bst comp)
  (when bst ; when there is a valid binary tree as input
    (let ((key (key bst)) ; let key be the key of the binary tree
          (left (lc bst)) ; let left be the left child of the binary tree
          (right (rc bst))) ; let right be the right child of the binary tree
      (cond ((funcall comp obj key) (make-bNode :key key :lc (bst-remove obj left comp) :rc right))
            ; if obj compares with key, create a binary tree with the key being the key
            ; the left child being the recursive call of obj left and comp, and the right child being the right child
            ((funcall comp key obj) (make-bNode :key key :lc left :rc (bst-remove obj right comp)))
            ; if key compares with obj, create a binary tree with the key being the key, the left child being the left child,
            ; and the right child being the recursive call of obj right comp
            (t (bst-join left right comp)))))) ; else join the left child and right using the comparator

(defun bst-join (left right comp)
  "joins two binary search trees."
  (cond ((null left) right) ; if the left subtree is null, return the right subtree
        ((null right) left) ; if the right subtree is null, return the left subtree
        ((zerop (random 2)) ; random choice for new root
         (let ((root (key (bst-max left)))) ; let the root be the maximum node of the left subtree
           (make-bNode :key root :lc (bst-remove root left comp) :rc right)))
           ; create a binary tree with the key being the root, the left child being the bst-remove function of the root, left subtree,
           ; and comp, and the right child being the right subtree
        (t (let ((root (key (bst-min right)))) ; let root be the minimum node of the right subtree
             (make-bNode :key root :lc left :rc (bst-remove root right comp))))))
             ; create a binary tree with the key being the root, the left child being the left subtree
             ; and the right child being the bst-remove function of the root, right subtree, and comp

; Minimum/Maximum
(defun bst-min (bst)
  (if (not (null bst)) ; if given binary tree is not null
      (or (bst-min (lc bst)) bst))) ; recursively call the left subtree or return the binary tree, if there is no more left child

(defun bst-min2 (bst)
  (and bst 
       (or (bst-min2 (lc bst)) bst)))

(defun bst-min3 (bst)
  (cond ((null bst) nil)
        ((null (lc bst)) (key bst))
        (t (bst-min3 (lc bst)))))

(defun bst-max (bst)
  (if (not (null bst)) ; if the given binary tree is not null
      (or (bst-max (rc bst)) bst))) ; recursively call the right subtree or return the binary tree, if there is no more right child

(defun bst-max2 (bst)
  (and bst
       (or (bst-max2 (rc bst)) bst)))

(defun bst-max3 (bst)
  (cond ((null bst) nil)
        ((null (rc bst)) (key bst))
        (t (bst-max3 (rc bst)))))





; Splay Trees
; => just like a binary tree, but every time we search for a node, that node "splays" to the top of the tree through a series or rotations
; => the tree must always be in sorted order

; Ex: Let's search for 11 in the following tree
;     35                     35               _11_
;    /  \                   /  \              /  \ 
;   10   37       ==>    _11_   37    ==>   10   35
;  /  \   \              /       \         /       \
; 8  _11_  99           10        99      8        37
;                      /                             \
;                     8                               99

; Splay Functions

; tree-rotate: given a target node, its parent, and its grandparent, rotates the node up to be in the parent's position and makes proper
;              connections with grandparent

; node-chain: given a target value and a root, returns the node containing the target value and a list of all the nodes from the target node
;             all the way up to the root

; splay: given a target node and a list of all the nodes from the target all the way up to the root, rotates the target node all the way up
;        to the root's position. Returns the target node, which is now the root

; st-search: given a target value and a root, if the value exists, splay it to the top of the tree and return the new root

; Target Value & Existing Tree ==> | st-search | -> Target Value & Existing Tree ==> | node-chain | -> Node Chain
; ==> | splay | node chain | | tree-rotate | | -> new tree with node at the top

; tree-rotate: move node one spot up
(defun tree-rotate (node parent grandparent)
  (cond
    ((eql node (lc parent)) (setf (lc parent) (rc node)
    ; if our node is equal to the left child of the parent, set the left child of the parent to be the right child of the node
                                  (rc node) parent)) ; also set the right child of node to be the parent
    ((eql node (rc parent)) (setf (rc parent) (lc node)
    ; if our node is equal to the right child of the parent, set the right child of the parent to be the left child of the node
                                  (lc node) parent)) ; also set the left child of the node to be the parent
    (t (error "NODE (~A) is not the child of PARENT (~A)" node parent)))

  (cond
    ((null grandparent) node) ; if the grandparent node is null, return node
    ((eql parent (lc grandparent)) (setf (lc grandparent) node))
    ; if the parent node is equal to the left child of the grandparent, set the left child of the grandparent to be the node
    ((eql parent (rc grandparent)) (setf (rc grandparent) node))
    ; if the parent node is equal to the right child of the grandparent, set the right child of the grandparent to be the node
    (t (error "PARENT (~A) is not the child of GRANDPARENT (~A)" parent grandparent))))

; node-chain: creating a list of nodes to target
(defun node-chain (item root &optional chain)
  "Returns the node containing ITEM (if found) and the chain of nodes leading ot it"
  (if root ; if given root
      (let ((key (key root)) ; let key be the key of the root
            (lc (lc root)) ; let lc be the left child of the root
            (rc (rc root)) ; let rc be the right child of the root
            (chain (cons root chain))) ; let chain be the chain with the root at the start of the list
        (cond ((< item key) (node-chain item lc chain)) ; if item is less than the key, recursively call with item lc and chain
              ((> item key) (node-chain item rc chain)) ; if item is greater than the key, recursively call with item rc and chain
              (t (values root chain)))) ; else 
      (values nil chain))) ; return chain to be all nil

; splay: repeating tree-rotate until root
(defun splay (node chain)
  (loop :for (parent grandparent) :on chain :do ; loop through each parent and grandparent of chain 
    (tree-rotate node parent grandparent)) ; tree-rotate node parent and grandparent
  node) ; return node once its at the top

; st-search: gets chain, splay does the rest
(defun st-search (item root)
  (multiple-value-bind (node chain) (node-chain item root) 
    (when node (splay (car chain) (cdr chain)))))

; Inserting Into A Splay Tree
; => to insert a node, descent the tree (less-left, greater-right) until we find the existing node or we find the place to insert.
; => after inserting splay the node up the tree to bring it to the top





; Heaps
; => they are binary trees, but they are not sorted like a binary tree
; => instead decreasing (or increasing) values as you descent the tree
; => for each node x with parent p, x's value should be less (or greater) than p's

; Min-Heap
; => all of the smaller values are at the top (the parent nodes are smaller than their children nodes) 

; Example of a min-heap
;      3
;    /   \
;   7    25
;  / \   /
; 22 18 29

; Max-Heap
; => all of the greater values are at the top (all the parent nodes are greater than their children nodes) 

; Example of a max-heap:
;       80
;     /    \ 
;   50      70
;  /  \    /  \
; 25  45  12  65

; Array Representation
; => first is parent, then left child, and finally right child.
; => the array is repeated for each branch

; Ex: Consider the following tree. The array representation for the tree is: 
;      3
;    /   \     Index:   0   1   2   3   4   5   6
;   7    25    Value:   3   7  25  22  18  29
;  / \   /
; 22 18 29

; Insertion, heap-push (max-heap)
(defun hparent (i) (floor (- i 1) 2)) ; getting the parent index

(defun heap-push (node vec) ; push a new node into the heap 
  (vector-push-extend node vec) ; put node at the end of vec
  (heap-up vec (1- (length vec)))) ; call heap-up with the vector and index of the last element (node)

(defun heap-up (vec i) 
  (when (and (> i 0) (> (aref vec i) (aref vec (hparent i)))) ; when i is greater than 0 and node at i is greater than the parent of i
    (rotatef (aref vec i) (aref vec (hparent i))) ; swap vector at i with vector at parent of i
    (heap-up vec (hparent i))) ; recursively call heap-up with vector and the index of the parent
  vec) ; return vector

; Deletion (heap-pop)
(defun hrt (i) (* (+ i 1) 2)) ; gets index of the node's right child
(defun hlt (i) (- (hrt i) 1)) ; gets index of node's left child (right - 1)

(defun heap-pop (vec)
  (rotatef (aref vec 0) (aref vec (- (length vec) 1))) ; swap vector at index 0 and the last element of the vector
  (prog1
      (vector-pop vec) ; pop the last element
    (heap-down vec 0))) ; call the function heap-down with the vector and position 0

(defun heap-down (vec beg &optional (end (length vec)))
  (let ((l (hlt beg)) ; let l be the index of the left child of the gibven index
        (r (hrt beg))) ; let r be the index of the right child of the given index
    (when (< l end) ; when l is less than the length of the vector
      (let ((child ; let child be the 
              (if (or (>= r end) ; if r is greater than or equal to end or
                      (> (aref vec l) (aref vec r))) ; the left child is greater than the right child
                  l ; return l
                  r))) ; return r
        (when (> (aref vec child) (aref vec beg)) ; when child element is greater than the element at the given index
          (rotatef (aref vec beg) (aref vec child)) ; swap the element at the given index with the child element
          (heap-down vec child end))))) ; recursively call heap-down with the vector, child, and end
  vec) ; return the vector

; Heap Creation (heapify)
(defun heapify (vec)
  (let ((mid (floor (length vec) 2))) ; let mid be the index of the middle element of the vector
    (dotimes (i mid) ; loop from i to mid
      (heap-down vec (- mid i 1)))) ; call heap-down function with the vector, and the index of the parent
  vec) ; return the vector

; Heapsort ==> O(n log n) 
; => take an existing vector and create a max-heap (heapify)
; => one at a time, rotate each node (starting with the leaves) to the top and perform a head down to propagate the biggest to the top
; => swap this with the next leaf to put the large number at the bottom. repeat.
(defun heapsort (vec)
  (heapify vec) ; first heapify vec
  (dotimes (i (length vec)) ; loop throught i and the length of the vector
    (let ((last (- (length vec) i 1))) ; let last be the index of the last element in the current array of the remaining elments
      (rotatef (aref vec 0) (aref vec last)) ; swap the first element and the last element of the remaining elements
      (heap-down vec 0 last))) ; 
  vec)





; Graphs
; => a graph G is defined as G = (V, E), where:
;    --> V is a set of vertices
;    --> E is a set of edges, each connecting a pair of vertices
;        --> edges may be directed or undirected
;        --> if all edges are directed, we have a directed graph

; Path
; => a sequence of vertices connected by edges

; Cycle
; => a path in a directed graph that starts and ends at the same vertex
; => a graph with no cycles is an acyclic graph
; => a directed graph with no cycles is a directed acyclic graph (DAG)

; Graph Representation: List ==> (Vi Vf Weight)
; => a list where each element is a list with (Vi Vf Weight)

; Graph Representation: Adjacency List ==> (Vi ((Vf Weight) ...))
; => a list where each element is a list with a vertex (Vi) and a list of key values (Vf - key, W - value)

; Graph Representation: Adjacency Matrix
; => N by N matrix where n is the number of vertices, and each cell corresponds to the cost/weight of the edge between two vertices.
; => rows represent Vi and columns represent Vf

; Ex: Consider the graph:
; V0 --(5)--> V1 --(4)--> V2 --(9)--> V3 --(7)--> V4   ,   V0 --(2)--> V5 --(8)--> V4   ,   V3 --(3)--> V5 --(1) --> V2
; the representation for this graph as a list is:
; setf *G* '(
;    (V0 V1 5)
;    (V0 V5 2)
;    (V1 V2 4)
;    (V2 V3 9)
;    (V3 V4 7)
;    (V3 V5 3)
;    (V5 V2 1)
;    (V5 V4 8)
; )
; the representation of this graph as an adjacency list is:
; setf *G* '(
;    (V0 ((V1 . 5) (V5 . 2)))
;    (V1 ((V2 . 4)))
;    (V2 ((V3 . 9)))
;    (V3 ((V4 . 7) (V5 . 3)))
;    (V5 ((V2 . 1) (V4 . 8)))
; )
; the representation of this graph as an adjacency matrix is:
;      V0   V1   V2   V3   V4   V5
; V0         5                   2
; V1              4
; V2                   9
; V3                        7    3
; V4     
; V5              1         8

; Spanning Tree
; => For a graph G = (V, E), a spanning tree is an acyclic subset of E that connects all the vertices in V using |V| - 1 edges.

; Minimum Spanning Tree
; => For a graph G = (V, E), the MST is a spanning tree where the sums of the weights of the edges is the minimum possible sum.
; => its the subtree that connects all nodes where the sum is the minimum of the weights combined

; Example for the previous graph, the MST is:
; V0 --(2)--> V5 --(3)--> V3 --(7)--> V4   ,   V1 --(4)--> V2 --(1)--> V5

; Prim's Algorithm => A method to obtain the MST of a given graph
; 1. Initialize Variables
;    ==> mstSet: a set of vertices in the SPT
;    ==> pq: a priority queue containing the vertices not yet in mstSet
; 2. For each vertex V in G
;    ==> insert in pq a pair (V weight) setting weight to be initially infinite
; 3. If V is S, assign 0 as the weight
; 4. Sort pq based on weight of each pair (V Weight) 






(defstruct node id edges) ; node id and its list of outgoing edges
(defstruct edge src dst label) ; let edge be an object with src node, dst node, and label/cost
(defstruct (graph (:conc-name nil)) ; let graph object be made of
  (nodes (make-hash-table))) ; nodes as a hash-table

; RTL-USER> (defvar g (make-graph)) ; an empty graph
; ==> G
; RTL-USER> (setf (gethash 1 (nodes g)) (make-node :id 1)) ; adding node 1
; ==> #S(NODE :ID 1 :EDGES NIL)
; RTL-USER> (gethash 1 (nodes g))
; ==> #S(NODE :ID 1 :EDGES NIL)
; RTL-USER> (setf (gethash 2 (nodes g)) (make-node :id 2)) ; adding node 2
; ==> #S(NODE :ID 2 :EDGES NIL)
; RTL-USER> (push (make-edge :src 1 :dst 2 :label "a") ; adding edge 1->2 to the data structure
;                 (node-edges (gethash 1 (nodes g))))
; ==> (#S(EDGE :SRC 1 :DST 2 :LABEL "a"))
; RTL-USER> (gethash 1 (nodes g)) ; node 1
; ==> #S(NODE :ID 1 :EDGES (#S(EDGE :SRC 1 :DST 2 :LABEL "a")))
; RTL-USER> (gethash 2 (nodes g)) ; node 2
; ==> #S(NODE :ID 2 :EDGES NIL)

(defun getset-# (key ht &optional new-val) ; key of the node, the hash table, and new-val to return the value
  "Gets value from the hash-table (ht) if key already present,
    otherwise sets the key to new-val in the hash table."
  (let ((val (gethash key ht))) ; let val be be the value of the key in the hash table
    (if val val ; if val is already present in the hash table
        (setf (gethash key ht) new-val)))) ; set value to be new-val

(defun init-graph (edges)
  "Builds and returns a graph for the given list of edges."
  (let* ((grph (make-graph)) ; let grph be a new graph
         (nodes (nodes grph))) ; let nodes be the nodes of grph
    (loop :for (src dst cost) :in edges ; loop for every src, dst, and cost in the list of edges
          :do
             (let ((src-node (getset-# src nodes (make-node :id src)))) ; let src-node be a new source node
               (getset-# dst nodes (make-node :id dst)) ; creates dst node
               (push (make-edge :src src :dst dst :label cost) ; creates and adds edge to the
                     (node-edges src-node)))) ; list of edges of the src node
    grph)) ; return grph 

; RTL-USER> (init-graph '((1 2 a) (1 3 c) (3 2 a)))


(defun get-node-ids (g &optional acc)
  "returns the list of node ids in hash-table G"
  (maphash #'(lambda (k v) (push k acc)) g) 
  acc) 

(defun pprint-graph (graph stream)
  (let ((ids (sort (get-node-ids (nodes graph)) '<))
        (format stream " ~{~@T~A~}~%" ids) ; prints items of list IDS separated by a tab
        (dolist (id1 ids)
          (let ((node (gethash id1 (nodes graph)))
                (format stream "~A" id1)                                                                            
                (dolist (id2 ids)
                  (format stream "~@T~:[ ~;x~]" ; if the argument is non-nil prints "x"
                          (find id2 (node-edges node) :key 'edge-dst)))
                (terpri stream))))))) ; outputs a newline to output-stream.

; CL-USER> (setf g (init-graph '((1 2 a) (1 3 c) (3 2 a))))
; CL-USER> (pprint-graph g t)
; ==>  1 2 3
;    1   x x
;    2
;    3   x