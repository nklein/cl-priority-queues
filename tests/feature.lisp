;;;; feature.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group feature-tests ()
  (nst:def-test feature-is-present (:true)
    (member :cdr-13 *features*))

  (nst:def-test feature-works-with-reader-plus-macro (:true)
    (or #+cdr-13 t))

  (nst:def-test feature-works-with-reader-minus-macro (:true)
    (and #-cdr-13 nil)))
