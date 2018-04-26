;; oc transpo api wrapper
;; for more info see:
;; http://www.octranspo.com/index.php/developers/documentation

(defpackage :oc-transpo
  (:use :common-lisp :http))

(in-package :oc-transpo)

(defconstant +base_uri+ "https://api.octranspo1.com/v1.2/")

(defun req (app-id api-key endpoint &rest data)
  (let ((url (concatenate 'string +base_uri+ endpoint)))
    (format t "~a" url)
    (xml (http-request url 
		       :method :post
		       :parameters `(("appID" . ,app-id) ("apiKey" . ,api-key) ,@data)))))))

(defun get-route-summary-for-stop (app-id api-key stopNo)
  (req app-id api-key "GetRouteSummaryForStop"
       `("stopNo" . ,stopNo)))

(defun get-next-trips-for-stop (app-id api-key stopNo routeNo)
  (req app-id api-key "GetNextTripsForStop"
       `("stopNo" . ,stopNo)
       `("routeNo" . ,routeNo)))

(defun get-next-trips-for-stop-all-routes (app-id api-key stopNo)
  (req app-id api-key "GetNextTripsForStopAllRoutes"
       `("stopNo" . ,stopNo)))
