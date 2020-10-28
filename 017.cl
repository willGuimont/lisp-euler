#!/usr/bin/sbcl --script
;(print (format nil "~r" 1234))

(defun iter (n c xs)
  (if (> c n)
    xs
    (iter n (+ c 1) (concatenate 'string xs (format nil "~r" c)))))

(defun foo (start end)
  (iter end start ""))

; number of and's
; (sum_{i=1}^{1000}  (floor(log_10 i) - 1)) - 2 = 891
(print (+ (* 3 891) (length (remove #\- (remove #\Space (foo 1 1000))))))

