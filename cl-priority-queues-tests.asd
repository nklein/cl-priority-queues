;;;; cl-priority-queues-tests.asd

(asdf:defsystem #:cl-priority-queues-tests
  :description "Tests for CDR-13: Priority Queues for Common Lisp"
  :author "Patrick Stein <pat@nklein.com>"
  :license "Free"
  :depends-on (#:cl-priority-queues
               #:closer-mop
               #:nst)
  :components
  ((:module "tests"
    :components ((:file "package")
                 (:file "fixtures" :depends-on ("package"))
                 (:file "feature" :depends-on ("package"))
                 (:file "class" :depends-on ("package"
                                             "fixtures"))
                 (:file "constructor" :depends-on ("package"
                                                   "fixtures"))
                 (:file "finger" :depends-on ("package"
                                              "fixtures"))
                 (:file "error" :depends-on ("package"
                                             "fixtures"))
                 (:file "empty-error" :depends-on ("package"))
                 (:file "invalid-finger-error" :depends-on ("package"))
                 (:file "invalid-key-error" :depends-on ("package"))
                 (:file "insert" :depends-on ("package"))
                 (:file "peek" :depends-on ("package"))
                 (:file "run" :depends-on ("package"))))))
