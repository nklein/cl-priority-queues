;;;; finger.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group finger-tests ()
  (nst:def-test type-is-present (:not :true)
    (nth-value 1 (ignore-errors
                   (typep nil 'cl-priority-queues:heap-finger)))))

(nst:def-test-group finger-predicate-tests (empty-heap)
  (nst:def-test heap-finger-p-on-non-object (:not :true)
    (heap-finger-p 1))

  (nst:def-test heap-finger-p-on-non-heap (:not :true)
    (heap-finger-p (make-instance 'stream)))

  (nst:def-test heap-finger-p-on-heap-finger (:true)
    (heap-finger-p (cl-priority-queues::make-heap-finger t))))
