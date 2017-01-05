;;;; content-at.lisp

(in-package #:cl-priority-queues)

(defgeneric content-at (heap finger)
  (:method ((heap heap) (finger heap-finger))
    (let ((node (checked-heap-finger-value heap finger)))
      (values (heap-node-key node)
              (heap-node-value node))))
  (:documentation "Returns the KEY and VALUE that can be found in the HEAP at the spot referred to by the FINGER."))

(defgeneric content-at* (heap finger)
  (:method ((heap heap) (finger heap-finger))
    (let ((node (checked-heap-finger-value heap finger)))
      (cons (heap-node-key node)
            (heap-node-value node))))
  (:documentation "Returns the (KEY . VALUE) that can be found in the HEAP at the spot referred to by the FINGER."))
