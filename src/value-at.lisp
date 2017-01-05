;;;; value-at.lisp

(in-package #:cl-priority-queues)

(defgeneric value-at (heap finger)
  (:method ((heap heap) (finger heap-finger))
    (heap-node-value (checked-heap-finger-value heap finger)))
  (:documentation "Returns the VALUE that can be found in the HEAP at the spot referred to by the FINGER."))

(defgeneric (setf value-at) (new-value heap finger)
  (:method (new-value (heap heap) (finger heap-finger))
    (setf (heap-node-value (checked-heap-finger-value heap finger))
          new-value))
  (:documentation "Sets the value in the HEAP referred to by FINGER to NEW-VALUE.  This may violate the heap invariant and may require a call to FIX-HEAP afterwards."))
