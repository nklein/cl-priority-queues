;;;; finger.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group finger-tests ()
  (nst:def-test class-is-present (:true)
    (values (ignore-errors
              (or (typep nil 'cl-priority-queues:heap-finger)
                  t)))))

(nst:def-test-group finger-predicate-tests (empty-heap)
  (nst:def-test heap-finger-p-on-non-object (:not :true)
    (heap-finger-p 1))

  (nst:def-test heap-finger-p-on-non-heap (:not :true)
    (heap-finger-p (make-instance 'stream)))

  (nst:def-test heap-finger-p-on-heap-finger (:true)
    (heap-finger-p (cl-priority-queues::make-heap-finger t))))

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
