;;;; invalid-finger-error.lisp

(in-package #:cl-priority-queues-tests)

(nst:def-test-group invalid-heap-finger-error-tests ()
  (nst:def-test invalid-heap-finger-error-present (:true)
    (make-condition 'cl-priority-queues:invalid-heap-finger-error))

  (nst:def-test invalid-finger-error-is-heap-error (:true)
    (typep (make-condition 'cl-priority-queues:invalid-heap-finger-error)
           'cl-priority-queues:heap-error))

  (nst:def-test invalid-finger-error-is-cell-error (:true)
    (let* ((error-symbol 'cl-priority-queues:invalid-heap-finger-error)
           (error-class (find-class error-symbol)))
      (member (find-class 'cl-priority-queues:heap-error)
              (closer-mop:class-direct-superclasses error-class))))

  (nst:def-test invalid-finger-error-is-more-heap-error-than-cell-error (:true)
    (let* ((class (find-class 'cl-priority-queues:invalid-heap-finger-error))
           (precedence (closer-mop:class-precedence-list class))
           (after (member (find-class 'cl-priority-queues:heap-error)
                          precedence)))
      (member (find-class 'cell-error) after))))
