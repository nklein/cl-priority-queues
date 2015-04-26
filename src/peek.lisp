;;;; peek.lisp

(in-package #:cl-priority-queues)

(defgeneric peek (heap &optional default error-if-empty)
  (:method ((heap heap) &optional default error-if-empty)
    "Return the top-value of the HEAP.  If the heap is empty and
ERROR-IF-EMPTY is true, then throw an EMPTY-HEAP-ERROR.  If the heap
is empty and ERROR-IF-EMPTY is NIL, then return DEFAULT."
    (cond
      ((empty-heap-p heap)
       (if error-if-empty
           (error 'empty-heap-error :heap heap)
           default))

      (t
       (flet ((keep-min-head (min-so-far new-node)
                (if (heap-< heap min-so-far new-node)
                    min-so-far
                    new-node)))
         (with-trees (trees) heap
           (heap-node-value (reduce #'keep-min-head trees)))))))

  (:documentation "Return the top-value of the HEAP.  If the heap is
empty and ERROR-IF-EMPTY is true, then throw an EMPTY-HEAP-ERROR.  If
the heap is empty and ERROR-IF-EMPTY is NIL, then return DEFAULT."))
