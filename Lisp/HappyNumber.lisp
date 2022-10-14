#!/usr/bin/sbcl --script

(defun sqr (n)
  (* n n))

;;; Reference: "rosettacode.org"
(defun sum-of-sqr-dgts (n)
  (loop for i = n then (floor i 10)
    while (plusp i)
      sum (sqr (mod i 10))))
 

;;; Reference: "rosettacode.org"
(defun is-happy (n &optional cache)
  (or (= n 1) 
    (unless (find n cache)
      (is-happy (sum-of-sqr-dgts n)
        (cons n cache)))))
 
        

;;;finds the norm of happy nubmer.
(defun find-norm (hnum)
  (let ((norm 1))  
    (loop for i = hnum then (sum-of-sqr-dgts i)
      while (/= i 1) do     
        (incf norm (sqr i)))
    (sqrt norm)))
 
  
;;;Main Function
;;Get input arguments
(format t "Enter first argument: ")
(finish-output)
(defvar a1 (read))
(clear-input)
(format t "Enter second argument: ")
(finish-output)
(defvar a2 (read))
(clear-input)

;; Making a key-value pair hash table
(defvar Pairs (make-hash-table))
;; A list for storing norms (keys) of hash table
(defvar keyList)

;;;Reference: https://www.youtube.com/watch?v=vPqqY9R2Tmc&t=52s
(loop for i from a1 to a2 do
    (if (is-happy i)
      (setf (gethash (find-norm i) Pairs) i)))
      
;;;Reference: https://www.youtube.com/watch?v=vPqqY9R2Tmc&t=52s
(setf keyList
    (loop for j being each hash-key of Pairs
      collect j))

(setf keyList  (sort keyList #'<))  ; sort list in ascending order
(setf keyList (reverse keyList))   ; reverse to get descending order

(cond ((and (> (list-length keyList) 0) (< (list-length keyList) 11))        ; chek the condition for 10 or less happy numbers
            (loop for norm in keyList do
              (write (gethash norm Pairs))))
        ( (> (list-length keyList) 10)                        ;check if there is more than 10 happy numbers 
          (let ((c 1))  
            (loop for norm in keyList do
              (write (gethash norm Pairs))
              (terpri)
              (incf c)
              (when (> c 10)
                (return))))) 
        (t (format t "NOBODY'S HAPPY!~%")))
