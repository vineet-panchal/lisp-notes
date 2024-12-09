; Parts 9 - 13 Practice Part 2

; QUESTION 1:
; Explain the difference between chaining and linear probing for handling collisions in hash tables. 
; Provide an example of how clustering can occur in linear probing.

; ANSWER: 
; Chaining involves using linked lists to chain elements that collide in hash tables, while linear
; probing uses an auxiliary hash function that places elements to the next avalible position in the
; hash table. 
; Clustering can occur in linear probing when elements that collide are placed in a sequence of already
; taken positions in the hash table. The auxiliary hash function repeats steps to put it to the next avaliable 
; position, which can lead to a sequence of taken positions, forming a cluster. 

; Chaining: Uses a linked list at each index of the hash table to store multiple elements that hash to the same index.

; Linear Probing: Finds the next available slot by checking subsequent indices when a collision occurs.

; For example, if keys k=3,10,17 are inserted with h(k)=k%7.
; h(3)=3
; h(10)=3
; h(17)=3
; With linear probing, keys occupy consecutive indices, leading to clustering.





; QUESTION 2: 
; Using the hash function h(k)=k%7, and keys {10,20,17,25,31}, show the resulting hash table using:
; Chaining
; Linear Probing
; Quadratic Probing



; ANSWER:
; Chaining:
; Index:          0          1          2          3          4         5          6 
; Value:                                  10->17->31         25                   20

; Linear Probing
; Index:          0          1          2          3          4         5          6 
; Value:         31                               10         17        25         20

; Quadratic Probing
; Index:          0          1          2          3          4         5          6 
; Value:                               31         10         25        17         20





; QUESTION 3:
; Perform the following traversals on the tree below:
; - Pre-order
; - In-order
; - Post-order
;      A
;    / | \
;   B  E  G
;  / \    |
; C  D    F



; ANSWER:
; Pre-Order: A B C D E G F
; In-Order: C B D A E F G 
; Post-Order: C D B E F G A





; QUESTION 4:
; Insert the following numbers into a binary search tree: {44,45,37,10,12,11,99}.



; ANSWER:
;    44
;   /  \
;  37  45
;  /    \ 
; 10   99
;  \
;  12
;  /
; 11





; QUESTION 5:
; Perform a splay operation on the following tree for the node with the value 20, 25, then 40.
;     30
;    / \
;   20 40
;  / \
; 10 25



; ANSWER:
;   20
;  /  \
; 10  30
;    / \
;   25 40

;   20
;  / \
; 10 25
;     \
;     30
;      \
;      40

;    25
;   / \
;  20 30
;  /   \
; 10   40

;    30
;   / \
;  25 40
;  /  
; 20
; /
; 10

;    40
;   / 
;  30 
;  /  
; 25
; /
; 20
; /
; 10





; QUESTION 6:
; Convert the following array into a max-heap: [3,7,5,2,1,8].



; ANSWER:
; First Index = (6 / 2) - 1 = 2
; Right Child = (2 + 1) * 2 = 6, no right child
; Left Child = 6 - 1 = 5
; Value Of First Index: 5
; Value Of Left Child: 8
; ==> heap-down on 5, because 5 < 8

; [3, 7, 8, 2, 1, 5]

; First Index = 1
; Right Child = (1 + 1) * 2 = 4
; Left Child  = 4 - 1 = 3
; Value Of First Index: 7
; Value Of Right Child: 1
; Value Of Left Child: 2
; ==> no need to perform heap-down because 7 > 2

; First Index: 0
; Right Child = (0 + 1) * 2 = 2
; Left Child = 2 - 1 = 1
; Value of First Index: 3
; Value Of Right Child: 8
; Value Of Left Child: 7
; ==> perform heap-down on 3, because 8 > 3

; [8, 7, 3, 2, 1, 5]

; ==> perform heap-down on 3 again, because 5 > 3

; [8, 7, 5, 2, 1, 3]





; QUESTION 7: 
; Sort the following array using Heapsort: [4,1,3,9,7,2]. Show intermediate steps.

; Parent: 6 / 2 - 1 = 2 ==> 3
; Right Child: (2 + 1) * 2 = 6, no right child
; Left Child: 6 - 1 = 5 ==> 2
; ==> no need to perform heap-down because 3 > 2

; Parent: 1 ==> 1
; Right Child: (1 + 1) * 2 = 4 ==> 7
; Left Child: 4 - 1 = 3 ==> 9
; ==> perform heap-down on 1, because 1 < 9

; [4, 9, 3, 1, 7, 2]

; Parent: 0 ==> 4
; Right Child: (0 + 1) * 2 = 2 ==> 3
; Left Child: 2 - 1 = 1 ==> 9
; ==> perform heap-down on 4, because 4 < 9

; [9, 4, 3, 1, 7, 2]

; ==> completed heapify 1, swap the root and the last element, and repeat on the rest of the array.

; [2, 4, 3, 1, 7] [9]

; Parent: 5 / 2 = 2 ==> 3
; Right Child: (2 + 1) * 2 = 6 ==> no right child
; Left Child: 6 - 1 = 5 ==> no left child

; Parent: 1 ==> 4
; Right Child: (1 + 1) * 2 = 4 ==> 7
; Left Child: 4 - 1 = 3 ==> 1
; ==> perform heap-down on 4, because 4 < 7

; [2, 7, 3, 1, 4] [9]

; Parent: 0 ==> 2
; Right Child: (0 + 1) * 2 = 2 ==> 3
; Left Child: 2 - 1 = 1 ==> 7
; ==> perform heap-down on 2, because 2 < 7

; [7, 2, 3, 1, 4] [9]

; completed heapify 2, swap the root and the last element, and repeat on the rest of the array

; [4, 2, 3, 1] [7, 9]

; Parent: 4 / 2 = 2 ==> 3
; Right Child: (2 + 1) * 2 = 6 ==> no right child
; Left Child: 6 - 1 = 5 ==> no left child

; Parent: 1 ==> 2
; Right Child: (1 + 1) * 2 = 4 ==> no right child
; Left Child: 4 - 1 = 3 ==> 1
; ==> no need to perform heap-down, because 2 > 1

; Parent: 0 ==> 4
; Right Child: (0 + 1) * 2 = 2 ==> 3
; Left Child: 2 - 1 = 1 ==> 2
; ==> no need to perform heap-down, because 4 > 3

; completed heapify 3, swap the root and the last element, and repeat on the rest of the array

; [2, 3, 1] [4, 7, 9]

; Parent: 3 / 2 - 1 = 0 ==> 2
; Right Child: (0 + 1) * 2 = 2 ==> 1
; Left Child: 2 - 1 = 1 ==> 3
; ==> perform heap-down on 2, because 2 < 3

; completed heapify 4, swap the root and the last element, and repeat on the rest of the array

; [2, 1] [3, 4, 7, 9]

; Parent: 2 / 2 - 1 = 0 ==> 2
; Right Child: (0 + 1) * 2 = 2 ==> no left child
; Left Child: 2 - 1 = 1 ==> 1
; ==> no need to perform heap-down, because 2 > 1

; completed heapify 5, swap the root and the last element, completed heapsort

; [1] [2, 3, 4, 7, 9]
; [1, 2, 3, 4, 7, 9]





; QUESTION 8: 
; Given the chaining hash table below, perform the following operations and show the result:
; - Add (5,"Five")
; - Remove (2,"Two")
; - Search for (11, "Eleven")

; Index:               0               1               2               3               4 
; Value:      (1, "One")                      (2, "Two") (11 . "Eleven")



; ANSWER: 
; Index:                         0               1               2               3               4 
; Value:  (1, "One")->(5 . "Five")                         DELETED (11 . "Eleven")





; QUESTION 9:
; What is the difference between a good and a poor hash function?



; ANSWER:
; Good Hash Function: Minimizes collisions and distributes keys uniformly across the hash table.
; Poor Hash Function: Causes clustering or many collisions, resulting in inefficient lookups.