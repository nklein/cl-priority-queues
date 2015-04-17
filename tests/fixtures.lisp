;;;; fixtures.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-fixtures empty-heap ()
  (empty-heap (make-instance 'heap)))
