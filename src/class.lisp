;;;; class.lisp

(in-package #:cl-priority-queues)

(defclass heap ()
  ((size :initform 0
         :type heap-size
         :reader heap-size
         :accessor %heap-size
         :documentation "The current number of items in the heap.")

   (key-function :initarg :key
                 :type heap-key-function
                 :reader heap-key-function
                 :documentation
"A function which takes an item to be added to the heap and extracts
the information which will be used to compare it against other items
already in the heap.")

   (test-function :initarg :test
                  :type heap-test-function
                  :reader heap-test-function
                  :documentation
"A function which takes two keys and returns a generalized boolean
indicating whether the first item precedes the second.

This heap implementation is a BINOMIAL HEAP.  This heap is never full.
It will allocate new nodes so long as memory is available..

Note (from CDR-13: 1.3.1 Heap Test must be a Total Order): There is no
way for a Common Lisp implementation to check and ensure that the
function that becomes the heap test (cfr., the constuctor make-heap)
is a total order (modulo equality). Providing a function that does not
represent a total order has undefined consequences.

Note (from CDR-13: 1.3.2 Equal Keys):
The relative order to elements in a heap that admits equal keys is
implementation dependent and should not be relied upon.")

   (trees :initform #()
          :accessor heap-trees
          :type heap-node-vector
          :documentation "The trees which make up this binomial heap."))

  (:default-initargs :test #'<
                     :key #'identity)
  (:documentation
"This class implements HEAP priority queues as defined in CDR-13:
Priority Queues for Common Lisp.
  https://common-lisp.net/project/cdr/document/13/index.html"))

(declaim (inline heap-p))
(defun heap-p (object)
  "This function returns `NIL` when called on a non-heap OBJECT a
non-null value if presented with a HEAP OBJECT."
  (typep object 'heap))

(defgeneric heap-total-size (heap)
  (:method ((heap heap))
    "The current number of allocated items for this heap."
    (heap-size heap))
  (:documentation "The current number of allocated items for this heap."))

(defgeneric empty-heap-p (heap)
  (:method ((heap heap))
    "Returns whether the heap is empty."
    (zerop (heap-size heap)))
  (:documentation "Returns whether the heap is empty."))

(defgeneric full-heap-p (heap)
  (:method ((heap heap))
    "Returns whether the heap is full.  The default HEAP
implementation never returns full."
    nil)
  (:documentation "Returns whether the heap is full."))

(declaim (inline heap-key))
(defun heap-key (heap value)
  (funcall (heap-key-function heap) value))

(declaim (inline heap-<))
(defun heap-< (heap node-a node-b)
  (funcall (heap-test-function heap)
           (heap-node-key node-a)
           (heap-node-key node-b)))
