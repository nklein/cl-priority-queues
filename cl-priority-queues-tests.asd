;;;; cl-priority-queues-tests.asd

(asdf:defsystem #:cl-priority-queues-tests
  :description "Implementation of CDR-13: Priority Queues for Common Lisp"
  :author "Patrick Stein <pat@nklein.com>"
  :license "Free"
  :depends-on (#:cl-priority-queues #:nst)
  :components
  ((:module "tests"
    :components ((:file "package")
                 (:file "feature" :depends-on ("package"))
                 (:file "class" :depends-on ("package"))
                 (:file "run" :depends-on ("package"))))))
