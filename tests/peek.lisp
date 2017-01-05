;;;; peek.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group peek-tests (empty-heap)
  (nst:def-test peek-empty-error
      (:err :type cl-priority-queues:empty-heap-error)
    (cl-priority-queues:peek empty-heap nil t))

  (nst:def-test peek-empty-default (:equal :default)
    (cl-priority-queues:peek empty-heap :default))

  (nst:def-test peek-single-item (:equal 37)
    (let ((heap (cl-priority-queues:make-heap)))
      (cl-priority-queues:insert heap 37)
      (cl-priority-queues:peek heap)))

  (nst:def-test peek-two-items (:equal 37)
    (let ((heap (cl-priority-queues:make-heap)))
      (cl-priority-queues:insert heap 37)
      (cl-priority-queues:insert heap 41)
      (cl-priority-queues:peek heap)))

  (nst:def-test peek-two-items-reversed (:equal 37)
    (let ((heap (cl-priority-queues:make-heap)))
      (cl-priority-queues:insert heap 41)
      (cl-priority-queues:insert heap 37)
      (cl-priority-queues:peek heap))))
