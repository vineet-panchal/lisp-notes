; Part 12 - Lecture 2

; HEAPIFY (heap creation)
; => given a vector of items, start creating the heap ordering from the middle of the vector, to the root
; => to create a max heap, percolate smaller items down the max heap, or percolate larger items down for a min heap
; => since the heap is a complete tree, the items past the mid point of the vector represent leaf nodes (no children)
; => if we start with a vector with n items then we can build the whole heap in O(n) operations
(defun heapify (vec)
  (let ((mid (floor (length vec) 2))) ; mid is a leaf node
    (dotimes (i mid)
      (heap-down vec (- mid i 1)))) ; mid-1 is an internal node
  vec)



; HEAPSORT
(defun heapsort (vec)
  (heapify vec) ; build a max heap
  (dotimes (i (length vec))
    (let ((last (- (length vec) i 1)))
      (rotatef (aref vec 0)(aref vec last)) ; swap first and last
      (heap-down vec 0 last))) ; head-down the first element
  vec)



; GRAPHS
; => more general structure than trees
; => used to represent many things:
;    --> systems of roads
;    --> computer networks
;    --> academic curriculum, etc.

; => A graph G is defined as G = (V, E), where:
;    --> V is a set of vertices
;    --> E is a set if edges, each connecting a pair of vertices
;        --> edges may be directed or undirected
;        --> if all edges are directed, it is a directed graph
;    --> a path is a sequence vertices connected by edges
;    --> a cycle is a path in a directed graph that starts and ends at the same vertex
;    --> a graph with no cycles is an acyclic graph
;    --> a directed graph with no cycles is a directed acyclic graph (DAG)

; Graph Representation
; Ex:
; V0 --(5)--> V1 --(4)--> V2 --(9)--> V3 --(7)--> V4  ,  V0 --(2)--> V5 --(8)--> V4  ,  V5 --(1)--> V2  ,  V3 --(3)--> V5
; => a list of edges (Vi, Vj, w), where Vi and Vj are vertices and w is the edge cost (weight of the edge)
; '((V0 V1 5) (V0 V5 2) (V1 V2 4) (V2 V3 9) (V3 V4 7) (V3 V5 3) (V5 V2 1))
; => as an adjacency list each element in the list represents a vertex and its edges and respective weights
; ((V0 ((V1 . 5) (V5 . 2)))
;  (V1 ((V2 . 4)))
;  (V2 ((V3 . 9)))
;  (V4 ((V4 . 7) (V5 . 3)))
;  (V5 ((V2 . 1) (V4 . 8))))

; Adjacency Matrix:
; => used for representing small graphs G = (V, E) that have many edges
; => not very efficient to represent sparse data, i.e., |E| << |V|^2

;     V0  V1  V2  V3  V4  V5
; V0      5               2
; V1          4
; V2              9
; V3                  7   3
; V4
; V5          1       8

