;;;; error.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group heap-error-tests (empty-heap)
  (nst:def-test heap-error-present (:true)
    (make-condition 'cl-priority-queues:heap-error))

  (nst:def-test heap-error-is-simple-error (:true)
    (typep (make-condition'cl-priority-queues:heap-error)
           'simple-error))

  (nst:def-test heap-error-default-to-nil-heap (:not :true)
    (heap-error-heap (make-condition 'heap-error)))

  (nst:def-test heap-error-settable-heap (:equal empty-heap)
    (heap-error-heap (make-condition 'heap-error :heap empty-heap))))
