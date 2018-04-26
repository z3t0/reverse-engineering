;; This is a reddit api wrapper
(defpackage :reddit
  (:use :http
	:io
	:common-lisp)
  (:export :authorize-prompt
	   :me
	   :karma))

(in-package :reddit) 
;; authentication
(defvar *code* nil)

(defun authorize-prompt ()
  "Prompts the user to input the authorization details in order to get an authorization code"
  (let ((client-id (prompt-string "Client ID"))
	(secret-id (prompt-string "Secret ID"))
	(username (prompt-string "Username"))
	(password (prompt-string "Password")))
    (authorize client-id secret-id username password)))


(defun authorize (client-id secret-id username password)
  "returns a code that can be used to perform authorized requests"
  (cdar
   (http-auth-basic "https://www.reddit.com/api/v1/access_token"
		    client-id
		    secret-id
		    '("grant_type" . "password")
		    `("username" . ,username)
		    `("password" . ,password))))

(defun get-auth (url code)
  (http-request (concatenate 'string +base_uri+ url)
		:additional-headers `(("Authorization" . ,(concatenate 'string "bearer " code)))))

;; API
(defconstant +base_uri+ "https://oauth.reddit.com/")

(defun api-me (code)
  (json (get-auth "api/v1/me" code)))

(defun karma (code) )
