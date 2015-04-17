;;;; invalid-key-error.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group invalid-key-error-tests (empty-heap)
  (nst:def-test invalid-key-error-present (:true)
    (make-condition 'cl-priority-queues:invalid-key-error))

  (nst:def-test invalid-key-error-is-heap-error (:true)
    (typep (make-condition 'cl-priority-queues:invalid-key-error)
           'cl-priority-queues:heap-error))

  (nst:def-test offender-defaults-to-nil (:not :true)
    (cl-priority-queues:invalid-key-error-offender
     (make-condition 'cl-priority-queues:invalid-key-error))))
