; Part 13 - Lecture 1

; Minimum Spanning Tree (MST)
; => a path that connects all vertices and has optimal total cost

; Spanning Tree
; => a spanning tree T for a graph G = (V, E) is an acyclic subset of E that connects all the vertices in V using |V| - 1 edges.

; Ex: Consider the graph below
; 0 <--(4)--> 1 <--(11)--> 7 <--(1)--> 6 <--(6)--> 8 <--(2)--> 2 <--(8)--> 1  ,  0 <--(8)--> 7 <--(7)--> 8
; For this graph there are two possible spanning trees.

; Spanning Tree 1, Cost = 31
; 0 <--(4)--> 1 <--(8)--> 2 <--(2)--> 8 <--(6)--> 6  ,  1 <--(11)--> 7

; Spanning Tree 2, Cost = 27                                                                                                                                
; 0 <--(4)--> 1 <--(8)--> 2 <--(2)--> 8 <--(6)--> 6  ,  7 <--(7)--> 8

; Spanning Tree 2 would be the minimum spanning tree of the graph because its cost is the least.



; Prim's Algorithm
; defun prim (G S): where G is a graph and S is a vertex of G
; 1. Let
;    --> mstSet be a set containing the vertices already included in the MST
;    --> pq be a priority queue (i.e., a Min-Heap) containing the vertices not yet in mstSet
; 2. For each vertex v in G
;    --> insert in pq a tuple (v weight) setting weight to be initially INFINITE.
; 3. Assign 0 to the weight of S in pq.
; 4. Sort pq based on the weight of each pair (v weight); small weight value means high priority.
; 5. While pq is not empty
;    --> (pop pq) ==> (u weight)
;    --> Include the tuple (u weight) in mstSet
;    --> For every edge (u, v) such that v is not in mstSet
;        --> if (u, v)'s weight is less than 's weight in pq,
;        --> update v's weight in pq as (u, v)'s weight
;        --> set u as v's predecessor

; Prim's Algorithm: Complexity Analysis
; => The choice of data structure and algorithm used to implement the priority queue determines the complexity of the algoithm
;    --> using a list as the priority queue: running time is O(V E) or O(n^2) or if we consider E = V
;    --> using a heap as the priority queue: running time is O(E log V)
