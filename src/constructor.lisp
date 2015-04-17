;;;; constructor.lisp

(in-package #:cl-priority-queues)

(defun remove-from-plist (plist &rest keys)
  "Remove any KEY/VALUE pair in PLIST if the KEY is in KEYS.  Do this
preserving as much structure as possible from the original PLIST."
  (when plist
    (destructuring-bind (key val &rest rest) plist
      (let ((new-rest (apply #'remove-from-plist rest keys)))
        (cond
          ((member key keys)
           new-rest)
          ((eq rest new-rest)
           plist)
          (t
           (list* key val new-rest)))))))

(defun make-heap (&rest
                    all-options
                  &key
                    (test #'<)
                    (key #'identity)
                    (initial-size 16)
                    (class 'heap)
                    initial-contents
                  &allow-other-keys)
  (check-type test heap-test-function)
  (check-type key heap-key-function)
  (check-type class (or class symbol))
  (check-type initial-size heap-size)
  (check-type initial-contents list)
  (let ((heap (apply #'make-instance class
                     (remove-from-plist all-options :class))))
    (check-type heap heap)
    heap))
