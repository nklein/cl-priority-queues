;;;; key-at.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group key-at-tests ()
  (nst:def-test insert-into-empty-returns-finger-to-new-key (:equal 38)
    (let ((heap (cl-priority-queues:make-heap :key #'1+)))
      (multiple-value-bind (value finger) (cl-priority-queues:insert heap 37)
        (declare (ignore value))
        (cl-priority-queues:key-at heap finger))))

  (nst:def-test insert-into-non-empty-heap-returns-finger-to-new-value
      (:equal 42)
    (let ((heap (cl-priority-queues:make-heap :key #'1+)))
      (cl-priority-queues:insert heap 37)
      (multiple-value-bind (value finger) (cl-priority-queues:insert heap 41)
        (declare (ignore value))
        (cl-priority-queues:key-at heap finger))))

  (nst:def-test insert-into-non-empty-heap-returns-finger-to-new-key-reverse
      (:equal 38)
    (let ((heap (cl-priority-queues:make-heap :key #'1+)))
      (cl-priority-queues:insert heap 41)
      (multiple-value-bind (value finger) (cl-priority-queues:insert heap 37)
        (declare (ignore value))
        (cl-priority-queues:key-at heap finger)))))
