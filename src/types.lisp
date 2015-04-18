;;;; types.lisp

(in-package #:cl-priority-queues)

(deftype heap-size ()
  "Data type used for size of heap."
  `(integer 0 *))

(deftype heap-key-function ()
  "Data type of heap key functions."
  'function)

(deftype heap-test-function ()
  "Data type of heap test functions."
  'function)

(deftype heap-node-vector (&optional (length '*))
  "Data type for a vector of heap nodes."
  `(vector heap-node ,length))
