;;;; empty-error.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group empty-heap-error-tests ()
  (nst:def-test empty-heap-error-present (:true)
    (make-condition 'cl-priority-queues:empty-heap-error))

  (nst:def-test empty-heap-error-is-heap-error (:true)
    (let ((error-class (find-class 'cl-priority-queues:empty-heap-error)))
      (member (find-class 'cl-priority-queues:heap-error)
              (closer-mop:class-direct-superclasses error-class)))))
