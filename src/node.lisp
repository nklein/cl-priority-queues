;;;; node.lisp

(in-package #:cl-priority-queues)

(defstruct (heap-node (:constructor make-heap-node (key value children)))
  (key nil :type t)
  (value nil :type t)
  (children #() :type vector))

(defun heap-node-order (node)
  (check-type node heap-node)
  (length (heap-node-children node)))

(defun heap-node-size (node)
  (check-type node heap-node)
  (ash 1 (heap-node-order node)))
