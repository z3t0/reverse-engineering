;; defines useful io abstractions
(defpackage :io
  (:use :common-lisp)
  (:export :prompt-string))

(in-package :io)

(defun prompt-string (prompt)
  (format t "~a: " prompt)
  (read-line))
