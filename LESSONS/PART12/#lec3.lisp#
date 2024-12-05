; Part 12 - Lecture 3

(defstruct node id edges) ; node id and its list of outgoing edges
(defstruct edge src dst label)
(defstruct (graph (:conc-name nil))
  (nodes (make-hash-table))) ; mapping of node ids to nodes

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

(defun getset-# (key ht &optional new-val)
  "Gets value from the hash-table (ht) if key already present,
    otherwise sets the key to new-val in the hash table."
  (let ((val (gethash key ht)))
    (if val val
        (setf (gethash key ht) new-val))))
(defun init-graph (edges)
  "Builds and returns a graph for the given list of edges."
  (let* ((grph (make-graph))
         (nodes (nodes grph)))
    (loop :for (src dst cost) :in edges
          :do
             (let ((src-node (getset-# src nodes (make-node :id src)))) ; creates src node
               (getset-# dst nodes (make-node :id dst)) ; creates dst node
               (push (make-edge :src src :dst dst :label cost) ; creates and adds edge to the
                     (node-edges src-node)))) ; list of edges of the src node
    grph))

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
    
