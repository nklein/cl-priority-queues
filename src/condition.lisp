;;;; conditions.lisp

(in-package #:cl-priority-queues)

(define-condition heap-error (simple-error)
  ((heap :initarg :heap
         :type (or heap null)
         :reader heap-error-heap
         :documentation "The HEAP associated with the condition or NIL
if not initialized."))
  (:report (lambda (condition stream)
             (format stream
                     "There is an unspecified heap error~@[ on heap ~A~]"
                     (heap-error-heap condition))))
  (:default-initargs :heap nil)
  (:documentation
"The root of specialized errors raised by the heap operations; the
heap for which the error is being signaled can be initialized with the
keyword :HEAP and can be read by the accessor HEAP-ERROR-HEAP.  The
default for the underlying slot is NIL."))
