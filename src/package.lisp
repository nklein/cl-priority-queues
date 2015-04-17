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
  ;; conditions.lisp
  (:export #:heap-error
           #:heap-error-heap)

  (:documentation "Implementation of CDR-13: Priority Queues for Common Lisp"))
