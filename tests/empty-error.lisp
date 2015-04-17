;;;; empty-error.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group empty-heap-error-tests (empty-heap)
  (nst:def-test empty-heap-error-present (:true)
    (make-condition 'cl-priority-queues:empty-heap-error))

  (nst:def-test empty-heap-error-is-heap-error (:true)
    (typep (make-condition'cl-priority-queues:empty-heap-error)
           'cl-priority-queues:heap-error)))
