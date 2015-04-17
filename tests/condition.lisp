;;;; conditions.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group conditions-exist-tests (empty-heap)
  (nst:def-test heap-error-present (:true)
    (find-class 'cl-priority-queues:heap-error nil))

  (nst:def-test heap-error-default-to-nil-heap (:not :true)
    (heap-error-heap (make-condition 'heap-error)))

  (nst:def-test heap-error-settable-heap (:equal empty-heap)
    (heap-error-heap (make-condition 'heap-error :heap empty-heap))))
