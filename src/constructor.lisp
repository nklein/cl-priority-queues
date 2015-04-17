;;;; constructor.lisp

(in-package #:cl-priority-queues)

(defun remove-from-plist (plist &rest keys)
  (loop :for key :in plist :by #'cddr
     :for value :in plist :by #'cddr
     :unless (member key keys)
     :append (list key value)))

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
