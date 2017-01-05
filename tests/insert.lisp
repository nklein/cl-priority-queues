;;;; insert.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group insert-tests ()
  (nst:def-test insert-into-empty-returns
      (:values (:equal 37)
               (:predicate cl-priority-queues:heap-finger-p))
    (let ((heap (cl-priority-queues:make-heap)))
      (cl-priority-queues:insert heap 37)))

  (nst:def-test insert-into-empty-makes-size-one (:equal 1)
    (let ((heap (cl-priority-queues:make-heap)))
      (cl-priority-queues:insert heap 37)
      (cl-priority-queues:heap-size heap)))

  (nst:def-test insert-into-non-empty-makes-size-one-greater (:equal 2)
    (let ((heap (cl-priority-queues:make-heap)))
      (cl-priority-queues:insert heap 37)
      (cl-priority-queues:insert heap 41)
      (cl-priority-queues:heap-size heap))))
