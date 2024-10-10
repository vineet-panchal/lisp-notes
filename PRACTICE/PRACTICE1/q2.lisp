; a farmer is trying to figure out where to grow there new plants
; their land consists of different "ground types": water (0), grass (1), soil (2), garden (3), & pavement (4)
; create a function that takes a list of ground types (0-4) and a coordinate that they are interested in (index)
; return the appropiate string to tell the farmer if they are able to grow their new plant in that coordinate
; if their coordinate is out of bounds (invalid index), return "Invalid Coordinate"
; Water: Ineligible, Grass: Valid, Soil: Valid, Garden: Occupied, Pavement: Cannot Plant Here

(defun good-land (lands coord) ; function that takes in a list and integer
  (cond
    ((< coord 0) "Invalid Coordinate")
    ((>= coord (length lands)) "Invalid Coordinate")
    ((= 0 (nth coord lands)) "Ineligible")
    ((= 1 (nth coord lands)) "Valid")
    ((= 2 (nth coord lands)) "Valid")
    ((= 3 (nth coord lands)) "Occupied")
    ((= 4 (nth coord lands)) "Cannot Plant Here")
    (t "Fatal Error")))
