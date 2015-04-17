;;;; constructor.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group constructor-tests (empty-heap)
  (nst:def-test constructor-is-present (:true)
    (functionp (symbol-function 'cl-priority-queues:make-heap)))

  (nst:def-test constructor-makes-heap (:true)
    (cl-priority-queues:heap-p (cl-priority-queues:make-heap)))

  (nst:def-test default-key-is-identity (:equal #'identity)
    (cl-priority-queues:heap-key-function empty-heap))

  (nst:def-test default-test-is-less (:equal #'<)
    (cl-priority-queues:heap-test-function empty-heap))

  (nst:def-test initial-size-must-be-valid (:err :type type-error)
    (cl-priority-queues:make-heap :initial-size 1/2))

  (nst:def-test test-must-be-a-function (:err :type type-error)
    (cl-priority-queues:make-heap :test t))

  (nst:def-test key-must-be-a-function (:err :type type-error)
    (cl-priority-queues:make-heap :key t))

  (nst:def-test class-must-make-a-heap (:err :type type-error)
    (cl-priority-queues:make-heap :class 'stream)))
