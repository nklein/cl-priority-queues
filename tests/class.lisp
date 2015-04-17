;;;; class.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-fixtures empty-heap ()
  (empty-heap (make-instance 'heap)))

(nst:def-test-group class-tests ()
  (nst:def-test class-is-present (:true)
    (find-class 'cl-priority-queues:heap nil)))

(nst:def-test-group predicate-tests (empty-heap)
  (nst:def-test heap-p-on-non-object (:not :true)
    (heap-p 1))

  (nst:def-test heap-p-on-non-heap (:not :true)
    (heap-p (make-instance 'stream)))

  (nst:def-test heap-p-on-heap (:true)
    (heap-p empty-heap)))

(nst:def-test-group reader-tests (empty-heap)
  (nst:def-test heap-size-on-empty-heap (:equal 0)
    (heap-size empty-heap))

  (nst:def-test heap-total-size-is-non-negative (:not (:predicate minusp))
    (heap-total-size empty-heap))

  (nst:def-test heap-total-size-is-at-least-heap-size (:true)
    (<= (heap-size empty-heap)
        (heap-total-size empty-heap)))

  (nst:def-test heap-key-function-is-function (:predicate functionp)
    (heap-key-function empty-heap))

  (nst:def-test heap-test-function-is-function (:predicate functionp)
    (heap-test-function empty-heap)))
