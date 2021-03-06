;; http utility functions

(ql:quickload :drakma)
(ql:quickload :cl-json)
(ql:quickload :xmls)

(defpackage :http
  (:use :common-lisp
	:drakma
	:cl-json
	:xmls)
  (:export :http-auth-basic
	   :http-request
	   :json
	   :xml
	   ))

(in-package :http)

;; drakma json encoding
(push (cons "application" "json") *text-content-types*)

(defun json (data)
  (decode-json-from-string data))

(defun xml (data)
  (xmls:parse data))

(defun http-auth-basic (url username password &rest data)
  (json (http-request url
			:method :post
			:basic-authorization `(,username ,password)
			:parameters data)))
