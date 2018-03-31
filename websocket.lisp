(defun create (uri)
  (wsd:make-client uri))

(defun connect (ws)
  (wsd:start-connection ws))

(defun send (ws msg)
  (wsd:send ws msg))

(defun disconnect (ws)
  (wsd:close-connection ws))

(defun on (ws msg cb)
  (wsd:on :message ws
	  ()))

(defmacro (ws msg cb)
    (wsd:on :message))
