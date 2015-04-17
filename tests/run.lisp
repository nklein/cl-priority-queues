;;;; run.lisp

(in-package #:cl-priority-queues-tests)

(defun run-tests (&key (debug-on-error nst:*debug-on-error*)
                       (debug-on-fail nst:*debug-on-fail*))
  (let ((nst:*debug-on-error* debug-on-error)
        (nst:*debug-on-fail* debug-on-fail))
    (nst:nst-cmd :run-package #.*package*)))
