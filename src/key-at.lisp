;;;; key-at.lisp

(in-package #:cl-priority-queues)

(defgeneric key-at (heap finger)
  (:method ((heap heap) (finger heap-finger))
    (heap-node-key (checked-heap-finger-value heap finger)))
  (:documentation "Returns the KEY that can be found in the HEAP at the spot referred to by the FINGER."))
