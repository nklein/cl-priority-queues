;;;; finger.lisp

(in-package #:cl-priority-queues)

(deftype weak-pointer () '(satisfies trivial-garbage:weak-pointer-p))

(defclass heap-finger ()
  ((pointer :initarg :pointer
            :reader heap-finger-pointer
            :type weak-pointer
            :documentation "Weak reference to the node pointed to."))
  (:documentation
"This is an opaque type used to provide a reference to an object at a
given position within the heap."))

(defun make-heap-finger (node)
  "Create a HEAP-FINGER pointing to the given NODE."
  (let ((pointer (trivial-garbage:make-weak-pointer node)))
    (make-instance 'heap-finger :pointer pointer)))

(declaim (inline heap-finger-p))
(defun heap-finger-p (object)
  "This function returns `NIL` when called on a non-heap-finger OBJECT
a non-null value if presented with a HEAP-FINGER OBJECT."
  (typep object 'heap-finger))

(declaim (inline heap-finger-value))
(defun heap-finger-value (finger)
  "Retrieve the node referenced by the HEAP-FINGER."
  (check-type finger heap-finger)
  (trivial-garbage:weak-pointer-value (heap-finger-pointer finger)))

(declaim (inline checked-heap-finger-value))
(defun checked-heap-finger-value (heap finger)
  (let ((node (heap-finger-value finger)))
    (unless node
      (error 'invalid-heap-finger-error :heap heap :name finger))
    node))
