; Part 9 - 12 Practice

; Question 1: Given the following hash table and probing function, perform the listed operations in order. Show the resulting table.
; h(k) = k Mod 9
; h'(k, i) = (h(k) + 2i) Mod 9
; Insert (14, “A”)
; Insert (10, “B”)
; Insert (20, “C”)
; Insert (1, “D”)
; Insert (28, “E”)
; Remove (1,”D”)
; Remove (28,”E”)
; Insert(39,”F”)

; (14, "A") ==> (14) Mod 9 = 5
; (10, "B) ==> (10) Mod 9 = 1
; (20, "C") ==> (20) Mod 9 = 2
; (1, "D") ==> (1) Mod 9 = 1
; (1, "D") ==> (1 + 2(1)) = 3
; (28, "E") ==> (28) Mod 9 = 1
; (28, "E") ==> (28 + 2(1)) = 3
; (28, "E") ==> (28 + 2(2)) = 5
; (28, "E") ==> (28 + 2(3)) = 7
; -(1, "D") ==> DELETED
; -(28, "E") ==> DELETED
; (39, "F") ==> (39) Mod 9 = 3 = DELETED = 3

; Index:          0           1          2          3          4          5          6          7          8
; Value:              (10, "B")  (20, "C")  (39, "F")             (14, "A")               DELETED





; Question 2: Given the following hash table and probing function, perform the listed operations in order. What would the output of each
; command be? What would the resulting table look like? You have been provided with the keys - their values will just add to the congestion
; of your solution.

; h(k) = k MOD 14
; h(i,k) = (h(k) + i + i^2) MOD 14

; Insert 29
; Insert 17
; Insert 13
; Insert 27
; Insert 16
; Insert 41
; Remove 29
; Remove 17
; Remove 13
; Remove 27
; Remove 31
; Insert 1
; Remove 16
; Remove 41



; ANSWER:
; (29) Mod 14 = 1
; (17) Mod 14 = 3
; (13) Mod 14 = 13
; (27) Mod 14 = 13
; (27 + 1 + 1) Mod 14 = 1
; (27 + 2 + 4) Mod 14 = 5
; (16) Mod 14 = 2
; (41) Mod 14 = 13
; (41 + 1 + 1) Mod 14 = 1
; (41 + 2 + 4) Mod 14 = 5
; (41 + 3 + 9) Mod 14 = 11
; -(29) ==> 1 = DELETED
; -(17) ==> 3 = DELETED
; -(13) ==> 13 = DELETED
; -(27) ==> 5 = DELETED
; -(16) ==> 2 = DELETED
; -(31) ==> No 31, element does not exist, don't do anything, continue.
; (1) Mod 14 = 1
; -(41) ==> 11 = DELETED

; Index:   0   1   2   3   4   5   6   7   8   9   10   11   12   13
; Value:       1 DEL DEL     DEL                       DEL       DEL





; QUESTION 3
; Given the following hash table and probing function, perform the listed operations in order. What would the output of each command be?
; What would the resulting table look like?

; Index:   0   1   2   3   4   5   6   7   8   9   10   11   12   13
; Value:                      33  48          23        11   54   27
; Hash Function: h(k) = (h’(k) + i) mod 14 where h’(k) = k mod 14

;Insert 25
; Insert 61
; Remove 54
; Remove 25
; Insert 82
; Insert 1
; Insert 63
; Remove 48
; Remove 11
; Remove 5



; ANSWER:
; (25) Mod 14 = 11
; (25 + 1) Mod 14 = 12
; (25 + 2) Mod 14 = 13
; (25 + 3) Mod 14 = 0
; (61) Mod 14 = 7
; -(54) ==> 12 = DELETED
; -(25) ==> 0 = DELETED
; (82) Mod 14 = 12
; (1) Mod 14 = 1
; -(48) ==> 6 = DELETED
; -(11) ==> 11 = DELETED
; -(5) == ; element does not exist, don't do anything, continue. 

; Index:   0   1   2   3   4   5   6   7   8   9   10   11   12   13
; Value: DEL   1              33 DEL  61  63  23       DEL   82   27






; QUESTION 4:
; Given the following hash table and probing function, perform the listed operations in order. What would the output of each command be?
; What would the resulting table look like? Why would we prefer to use quadratic probing over linear probing?

; Index:   0   1   2   3   4   5   6   7   8   9   10   11   12   13
; Value:  22  56       3   4      17           9

; Hash Function: h(k) = (h’(k) + i + i2) mod L where h’(k) = k mod L and i = # of probes

; Insert 83
; Insert 6
; Remove 17
; Remove 6



; ANSWER:
; (83) Mod 11 = 6
; (83 + 1 + 1) Mod 11 = 8
; (6) Mod 11 = 6
; (6 + 1 + 1) Mod 11 = 8
; (6 + 2 + 4) Mod 11 = 1
; (6 + 3 + 9) Mod 11 = 7
; -(17) ==> 6 = DELETED
; -(6) ==> 7 = DELETED

; Index:   0   1   2   3   4   5   6   7   8   9   10
; Value:  22  56       3   4     DEL DEL  83   9





; QUESTION 5:
; Using Depth-First Search, search for the given element in the tree, printing all the elements in the order visited until you find the
; element. Use Pre-Order, In-Order, and Post-Order. Search for 60 in:
;     55
;    /  \
;   44  57
;  /  \   \
; 2   48   76
;  \      /  \
;   9    60  89

; 5.a) Pre-Order
; 55 44 2 9 48 57 76 60 _ 

; 5.b) In-Order
; 2 9 44 48 55 57 60 _ _

; 5.c) Post-Order
; 9 2 48 44 60 _ _ _ _





; QUESTION 6:
; Given the Binary Search Tree Below, Perform the following operations in order. What are their outputs? What would the resulting tree look
; like?
;       40
;    /      \
;   30      80
;  /  \     /
; 10  35   60
;  \      /  \
;  20    50  70
;       /    / \
;      45   65 75

; 6.a) Insert 25
;        40                                                                                                                                  
;    /        \                                                                                                                               
;   30        80                                                                                                                              
;  /  \       /                                            
; 10  35     60
;  \        /  \                                                                                                                            
;  20      50  70                                                           
;   \     /    / \                                                                                                                  
;   25   45   65 75   

; 6.b) Insert 47
;        40                                                                                                                                  
;    /        \                                                                                                                               
;   30        80                                                                                                                              
;  /  \       /                                            
; 10  35     60
;  \        /  \                                                                                                                            
;  20      50  70                                                           
;   \     /    / \                                                                                                                  
;   25   45   65 75   
;         \
;         47

; 6.c) Remove 80
;        40                                                                                                                                  
;    /       \                                                                                                                                
;   30       60                                                                                                                               
;  /  \     /  \                                           
; 10  35   50  70
;  \       /   / \                                                                                                                             
;  20     45  65 75                                                           
;   \      \                                                                                                                 
;   25     47   
;

; 6.c) Remove 80
;        40                                                                                                                                  
;    /       \                                                                                                                                
;   30       60                                                                                                                               
;  /  \     /  \                                           
; 10  35   50  70
;  \       /   / \                                                                                                                             
;  20     45  65 75                                                           
;   \      \                                                                                                                 
;   25     47   

; 6.d) Remove 40                                                             
;      35
;    /   \
;   30   60
;  /    /  \ 
; 10   50  70
; \    /   / \
; 20  45  65 75
; \    \
; 25   47

; 6.e) What is the max value? 
; 75

; 6.f) What is the min value?
; 10





; QUESTION 7
; Given the following Splay Tree, perform the necessary operations in order 
; and show your transformations for the following commands.
;       57
;    /      \
;   25      92
;  /  \    /  \
; 8   43  74  94
;     /  / 
;    40 61

; 7.a) Search 43
;         57
;      /      \
;    43       92
;    /       /  \
;   25      74  94
;  /  \    / 
; 8   40  61

;         43
;      /      \
;    25       57
;   /  \       \
;  8   40      92
;             /  \
;            74  94
;            /
;           61

; 7.b) Insert 55
;         43
;      /      \
;    25       57
;   /  \     /  \
;  8   40   55  92
;              /  \
;             74  94
;            /
;           61

;         43
;      /      \
;    25       55
;   /  \        \
;  8   40       57
;                 \
;                 92
;                /  \
;               74  94
;              /
;             61

;          55
;        /   \
;       43   57
;      /      \   
;    25       92
;   /  \     /  \
;  8   40   74  94
;           /      
;          61   

; 7.c) Search 94
;          55
;        /   \
;       43   57
;      /      \   
;    25       94
;   /  \     / 
;  8   40   92  
;           /      
;          74
;          /
;         61

;          55
;        /   \
;       43   94
;      /     /   
;    25     92
;   /  \    / 
;  8   40  74  
;          /      
;         61
;        /
;       57

;          94
;          /   
;         92   
;         /       
;        74    
;        /       
;       61       
;       /  
;      57  
;      /
;     55
;     /
;    43
;    /
;   25
;  /  \
; 8   40 

; 7.d) Insert 
;          94
;          /   
;         92   
;         /       
;        74    
;        /       
;       61       
;       /  
;      57  
;      /
;     55
;     /
;     43
;    / \ 
;   25 51
;  /  \
; 8   40 

;           94
;           /   
;          92   
;          /       
;         74    
;         /       
;        61       
;        /  
;       57  
;       /
;      55
;      /
;     51
;     /  
;    43 
;    /  
;   25   
;  / \
; 8  40

;           94
;           /   
;          92   
;          /       
;         74    
;         /       
;        61       
;        /  
;       57  
;       /
;      51
;      / \
;     43 55
;     /  
;    24 
;    / \  
;   8  40

;           94
;           /   
;          92   
;          /       
;         74    
;         /       
;        61       
;        /  
;       51  
;       / \ 
;      43 55
;      /   \
;     24   57
;     / \  
;    8 40

;            51
;           / \  
;          43 55  
;          /   \    
;         24   57 
;         / \   \    
;        8  40  61     
;                \  
;                74  
;                 \ 
;                 92
;                  \
;                  94



; QUESTION 8: 
; Given the following Max Heaps, trace through the transformations for the following commands. 
; Show the tree and array representation for each step.

; heap-push 60
; heap-pop
; heap-push 70
; heap-push 57

;       85
;    /     \
;   28     54
;  /  \    /
; 13  17  4



; ANSWER:
; | 85 | 28 | 54 | 13 | 17 | 4 |

; heap-push 60
; | 85 | 28 | 54 | 13 | 17 | 4 | 60 | ==> perform heap-up on 60, because 60 > 54
; | 85 | 28 | 60 | 13 | 17 | 4 | 54 |

; heap-pop
; | 54 | 28 | 60 | 13 | 17 | 4 | 85 | ==> perform rotatef and swap 54 and 85
; | 54 | 28 | 60 | 13 | 17 | 4 | ==> perform heap-down on 54, because 60 > 54
; | 60 | 28 | 54 | 13 | 17 | 4 |

; heap-push 70
; | 60 | 28 | 54 | 13 | 17 | 4 | 70 | ==> perform heap-up, because 70 > 54
; | 60 | 28 | 70 | 13 | 17 | 4 | 54 | ==> perform heap-up, because 70 > 60
; | 70 | 28 | 60 | 13 | 17 | 4 | 54 | 

; heap-push 57
; | 70 | 28 | 60 | 13 | 17 | 4 | 54 | 57 | ==> perform heap-up, because 57 > 13
; | 70 | 28 | 60 | 57 | 17 | 4 | 54 | 13 | ==> perform heap-up, because 57 > 28
; | 70 | 57 | 60 | 28 | 17 | 4 | 28 | 13 |



; Given the following array, perform the Heapify operation, showing each transformation as 
; the tree and array representation for each step.

; 9.a) 
;   Key:   0   1   2   3   4   5   6   7   8   9
; Value:  11  10  14   6   9   5   8  12  13   7



; ANSWER: 
; Length = 10
; First Index = (10 / 2) - 1 = 4
; Right Child index = (4 + 1) * 2 = 10 (N/A), no right child
; Left Child index = Right - 1 = 9
; Value At First Index: 9
; Value At Left Child Index: 7
; ==> no need to perform heap-down on 9, because 9 > 7

; Next index = 3
; Right Child index = (3 + 1) * 2 = 8 
; Left Child index = Right - 1 = 7
; Value At First Index: 6
; Value At Right Child Index: 13
; Value At Left Child Index: 12
; ==> perform heap-down on 6, because 13 > 6

; | 11 | 10 | 14 | 13 | 9 | 5 | 8 | 12 | 6 | 7 |

; Next index = 2
; Right Child index = (2 + 1) * 2 = 6 
; Left Child index = Right - 1 = 5
; Value At First Index: 14
; Value At Right Child Index: 8
; Value At Left Child Index: 5
; ==> no need to perform heap-down on 13, because 14 > 9

; Next index = 1
; Right Child index = (1 + 1) * 2 = 4 
; Left Child index = Right - 1 = 3
; Value At First Index: 10
; Value At Right Child Index: 9
; Value At Left Child Index: 13
; ==> perform heap-down on 10, because 10 < 13

; | 11 | 13 | 14 | 10 | 9 | 5 | 8 | 12 | 6 | 7 |

; ==> perform heap-down on 10 again, because 10 < 12

; | 11 | 13 | 14 | 12 | 9 | 5 | 8 | 10 | 6 | 7 |

; Next index = 0
; Right Child index = (0 + 1) * 2 = 2 
; Left Child index = Right - 1 = 1
; Value At First Index: 11
; Value At Right Child Index: 14
; Value At Left Child Index: 13
; ==> perform heap-down on 11, because 14 > 11

; | 14 | 13 | 11 | 12 | 9 | 5 | 8 | 10 | 6 | 7 |

; ==> the result is a max-heap





; QUESTION 10
; Apply Prim’s Algorithm to find the MST of the following graphs. 
; Produce the weight table and visual representation of the MST.

; 10.a) 
; Start with Node S
; ‘( ( P ‘((Q . 8)  (R . 7)  (T . 12) (U . 15)) )
;   ( Q ‘((P . 8)  (R . 20) (T. 2)  (V . 16)) )
;   ( R ‘((P . 7)  (Q . 20) (S . 5)  (V . 4)) )
;   ( S ‘((R . 5)  (V . 4)  (W . 14)) )
;   ( T ‘((P . 12) (Q . 2) (V . 6)) )
;   ( U ‘((P . 15) (V . 11) (W . 19)) )
;   ( V ‘((Q . 16) (R . 4) (U . 11) (S . 4)  (T . 6)  (W . 19)) )
;   ( W ‘((S . 14) (U . 19)) ) )



; ANSWER: 
; Nodes             Cost/Weight               Predecessor
; P                 ∞, 7,                     R                                                              
; Q                 ∞, 16, 8, 2               V, P, T                      
; R                 ∞, 5, 4                   S, V                        
; S                 0,                                        
; T                 ∞, 6                      V
; U                 ∞, 11                 P, V         
; V                 ∞, 4                      S 
; W                 ∞, 14                     S



; 10.b)
; Start with node A
; ‘( ( A ((B . 4) (C . 2) (D . 5)) )     -  
;    ( B ((A . 4) (C . 6) (E . 3) (F . 7)) )  - 
;    ( C ((A . 2) (B . 6) (D . 1) (F . 8) (G . 3)) )  -
;    ( D ((A . 5) (C . 1) (G . 4)) )   -  
;    ( E ((B . 3) (F . 2) (H . 5)) )   - 
;    ( F ((B . 7) (C . 8) (E . 2) (G . 6) (H . 3)) )  -
;    ( G ((C . 3) (D . 4) (F . 6) (I . 7)) ) -
;    ( H ((E . 5) (F . 3) (I . 4)) )
;    ( I ((G . 7) (H . 4)) ) )



; ANSWER: 
; Nodes             Cost/Weight               Predecessor
; A                 0,                                                                                    
; B                 ∞, 4                      A                  
; C                 ∞, 2                      A                      
; D                 ∞, 5, 1                   A, C                  
; E                 ∞, 3                      B
; F                 ∞, 8, 6, 2                C, G, E    
; G                 ∞, 3                      C 
; H                 ∞, 5, 3                   E, F                      
; I                 ∞, 7, 4                   G, H                      



; 10.c)
; Start with node L. Is this a directed or undirected graph?
; ‘( ( L ((M . 7) (N . 8) (O . 8) (X . 6)) )    -
;    ( M ((L . 10) (O . 1) (Q . 3)) )
;    ( N ((O . 4) (X . 7)) )
;    ( O ((P . 12) (Y . 3)) )   - 
;    ( P ((Q . 1)) )    -
;    ( Q ((Z . 4)) )    -
;    ( X ((O . 5) (Y . 4) (Z . 7)) )    -
;    ( Y ((P . 5) (X . 2) (Z . 6)) )  -
;    ( Z ((P . 2) (M . 3) ) )   - 



; ANSWER:
; It is a directed graph, because every node points to another node with a different cost. 
; Nodes             Cost/Weight               Predecessor
; L                 0                                                                                    
; M                 ∞, 7, 3                       L, Z                                      
; N                 ∞, 8                        L                                        
; O                 ∞, 8, 5                        L, X                                  
; P                 ∞, 5                        Y                
; Q                 ∞, 1                        P
; X                 ∞, 6                        L                    
; Y                 ∞, 4, 3                        X, O                       
; Z                 ∞, 7, 6                       X, Y     