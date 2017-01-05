;;;; content-at.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group content-at-tests ()
  (nst:def-test insert-into-empty-returns-finger-to-new-content
      (:values (:equal 38) (:equal 37))
    (let ((heap (cl-priority-queues:make-heap :key #'1+)))
      (multiple-value-bind (value finger) (cl-priority-queues:insert heap 37)
        (declare (ignore value))
        (cl-priority-queues:content-at heap finger))))

  (nst:def-test insert-into-non-empty-heap-returns-finger-to-new-content
      (:values (:equal 42) (:equal 41))
    (let ((heap (cl-priority-queues:make-heap :key #'1+)))
      (cl-priority-queues:insert heap 37)
      (multiple-value-bind (value finger) (cl-priority-queues:insert heap 41)
        (declare (ignore value))
        (cl-priority-queues:content-at heap finger))))

  (nst:def-test
      insert-into-non-empty-heap-returns-finger-to-new-content-reverse
      (:values (:equal 38) (:equal 37))
    (let ((heap (cl-priority-queues:make-heap :key #'1+)))
      (cl-priority-queues:insert heap 41)
      (multiple-value-bind (value finger) (cl-priority-queues:insert heap 37)
        (declare (ignore value))
        (cl-priority-queues:content-at heap finger)))))

(nst:def-test-group content-at*-tests ()
  (nst:def-test insert-into-empty-returns-finger-to-new-content
      (:equal (cons 38  37))
    (let ((heap (cl-priority-queues:make-heap :key #'1+)))
      (multiple-value-bind (value finger) (cl-priority-queues:insert heap 37)
        (declare (ignore value))
        (cl-priority-queues:content-at* heap finger))))

  (nst:def-test insert-into-non-empty-heap-returns-finger-to-new-content
      (:equal (cons 42 41))
    (let ((heap (cl-priority-queues:make-heap :key #'1+)))
      (cl-priority-queues:insert heap 37)
      (multiple-value-bind (value finger) (cl-priority-queues:insert heap 41)
        (declare (ignore value))
        (cl-priority-queues:content-at* heap finger))))

  (nst:def-test
      insert-into-non-empty-heap-returns-finger-to-new-content-reverse
      (:equal (cons 38 37))
    (let ((heap (cl-priority-queues:make-heap :key #'1+)))
      (cl-priority-queues:insert heap 41)
      (multiple-value-bind (value finger) (cl-priority-queues:insert heap 37)
        (declare (ignore value))
        (cl-priority-queues:content-at* heap finger)))))
