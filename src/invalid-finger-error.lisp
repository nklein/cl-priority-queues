;;;; invalid-finger-error.lisp

(in-package #:cl-priority-queues)

(define-condition invalid-heap-finger-error (heap-error cell-error)
  ()
  (:report (lambda (condition stream)
             (format stream
                     "The heap-finger ~A is invalid~@[ on heap ~A~]."
                     (cell-error-name condition)
                     (heap-error-heap condition))))
  (:documentation
"This condition may be signaled when operations are attempted on a
particular position in the heap but that position is not valid."))
