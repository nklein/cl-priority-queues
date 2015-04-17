;;;; cl-priority-queues.asd

(asdf:defsystem #:cl-priority-queues
  :description "Implementation of CDR-13: Priority Queues for Common Lisp"
  :author "Patrick Stein <pat@nklein.com>"
  :version "0.1.20150417"
  :license "UNLICENSE"
  :depends-on (#:trivial-garbage)
  :in-order-to ((asdf:test-op (asdf:load-op :cl-priority-queues-tests)))
  :perform (asdf:test-op (o c) (uiop:symbol-call :cl-priority-queues-tests
                                                 :run-tests))
  :components
  ((:static-file "README.md")
   (:static-file "UNLICENSE.txt")
   (:module "src"
    :components ((:file "package")
                 (:file "feature" :depends-on ("package"))
                 (:file "types" :depends-on ("package"))
                 (:file "class" :depends-on ("package"
                                             "types"))
                 (:file "constructor" :depends-on ("package"
                                                   "types"
                                                   "class"))
                 (:file "finger" :depends-on ("package"))
                 (:file "error" :depends-on ("package"
                                             "class"))
                 (:file "empty-error" :depends-on ("package"
                                                   "error"))
                 (:file "invalid-finger-error" :depends-on ("package"
                                                            "error"))
                 (:file "invalid-key-error" :depends-on ("package"
                                                         "error"))))))
