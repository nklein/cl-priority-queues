;;;; package.lisp

(defpackage #:cl-priority-queues
  (:use #:cl)
  ;; class.lisp
  (:export #:heap
           #:heap-p
           #:heap-size
           #:heap-total-size
           #:heap-key-function
           #:heap-test-function)
  ;; conditions.lisp
  (:export #:heap-error
           #:heap-error-heap))
