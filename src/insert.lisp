;;;; insert.lisp

(in-package #:cl-priority-queues)

(declaim (inline heap-key))
(defun heap-key (heap value)
  (funcall (heap-key-function heap) value))

(declaim (inline heap-<))
(defun heap-< (heap node-a node-b)
  (funcall (heap-test-function heap)
           (heap-node-key node-a)
           (heap-node-key node-b)))

(declaim (inline vector*))
(defun vector* (item rest)
  (concatenate 'vector (vector item) rest))

(defmacro with-children ((children) tree &body body)
  `(with-accessors ((,children heap-node-children)) ,tree
     ,@body))

(defmacro with-trees ((trees) heap &body body)
  `(with-accessors ((,trees heap-trees)) ,heap
     ,@body))

(defun merge-tree (heap node-a node-b)
  (flet ((add-sub-tree (tree sub)
           (with-children (children) tree
             (setf children (vector* sub children)))))
    (if (heap-< heap node-a node-b)
        (add-sub-tree node-a node-b)
        (add-sub-tree node-b node-a))))

(defgeneric insert (heap value)
  (:method ((heap heap) value)
    "Insert the given VALUE into the HEAP."
    (let* ((key (heap-key heap value))
           (node (make-heap-node key value #())))
      ;; XXX for now, just plopping it in the vector of trees
      (with-trees (trees) heap
        (setf trees (vector* node trees)))
      (incf (%heap-size heap))
      (values value (make-heap-finger node))))

  (:documentation "Insert the given VALUE into the HEAP."))
