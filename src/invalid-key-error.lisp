;;;; invalid-key-error.lisp

(in-package #:cl-priority-queues)

(define-condition invalid-key-error (heap-error)
  ((offender :initarg :offender
             :type t
             :reader invalid-key-error-offender
             :documentation "The key which caused this invalid key error."))
  (:report (lambda (condition stream)
             (format stream
                     "The key ~A is invalid~@[ for heap ~A~]."
                     (invalid-key-error-offender condition)
                     (heap-error-heap condition))))
  (:default-initargs :offender nil)
  (:documentation
"This condition is signaled when certain operations are attempted with
an invalid key for the heap."))
