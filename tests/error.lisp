;;;; error.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group heap-error-tests (empty-heap)
  (nst:def-test heap-error-present (:true)
    (make-condition 'cl-priority-queues:heap-error))

  (nst:def-test heap-error-is-simple-error (:true)
    (let ((heap-error-class (find-class 'cl-priority-queues:heap-error)))
      (member (find-class 'cl:simple-error)
              (closer-mop:class-direct-superclasses heap-error-class))))

  (nst:def-test heap-error-default-to-nil-heap (:not :true)
    (cl-priority-queues:heap-error-heap
     (make-condition 'cl-priority-queues:heap-error)))

  (nst:def-test heap-error-settable-heap (:equal empty-heap)
    (cl-priority-queues:heap-error-heap
     (make-condition 'cl-priority-queues:heap-error :heap empty-heap))))
