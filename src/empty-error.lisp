;;;; empty-error.lisp

(in-package #:cl-priority-queues)

(define-condition empty-heap-error (heap-error)
  ()
  (:report (lambda (condition stream)
             (format stream
                     "The heap ~A is empty."
                     (heap-error-heap condition))))
  (:documentation
"This error is signaled when an operation cannot be completed because
the heap is empty."))
