;;;; package.lisp

(defpackage #:cl-priority-queues
  (:use #:cl)
  ;; finger.lisp
  (:export #:heap-finger
           #:heap-finger-p)
  ;; class.lisp
  (:export #:heap
           #:heap-p
           #:heap-size
           #:heap-total-size
           #:heap-key-function
           #:heap-test-function)
  ;; error.lisp
  (:export #:heap-error
           #:heap-error-heap)
  ;; empty-error.lisp
  (:export #:empty-heap-error)
  ;; invalid-finger-error.lisp
  (:export #:invalid-heap-finger-error)
  ;; invalid-key-error.lisp
  (:export #:invalid-key-error
           #:invalid-key-error-offender)

  (:documentation "Implementation of CDR-13: Priority Queues for Common Lisp"))
