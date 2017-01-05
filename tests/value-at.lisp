;;;; value-at.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group value-at-tests ()
  (nst:def-test insert-into-empty-returns-finger-to-new-value (:equal 37)
    (let ((heap (cl-priority-queues:make-heap)))
      (multiple-value-bind (value finger) (cl-priority-queues:insert heap 37)
        (declare (ignore value))
        (cl-priority-queues:value-at heap finger))))

  (nst:def-test insert-into-non-empty-heap-returns-finger-to-new-value
      (:equal 41)
    (let ((heap (cl-priority-queues:make-heap)))
      (cl-priority-queues:insert heap 37)
      (multiple-value-bind (value finger) (cl-priority-queues:insert heap 41)
        (declare (ignore value))
        (cl-priority-queues:value-at heap finger))))

  (nst:def-test insert-into-non-empty-heap-returns-finger-to-new-value-reverse
      (:equal 37)
    (let ((heap (cl-priority-queues:make-heap)))
      (cl-priority-queues:insert heap 41)
      (multiple-value-bind (value finger) (cl-priority-queues:insert heap 37)
        (declare (ignore value))
        (cl-priority-queues:value-at heap finger))))

  (nst:def-test value-at-is-setfable (:equal 32)
    (let ((heap (cl-priority-queues:make-heap)))
      (multiple-value-bind (value finger) (cl-priority-queues:insert heap 37)
        (declare (ignore value))
        (setf (cl-priority-queues:value-at heap finger) 32)))))
