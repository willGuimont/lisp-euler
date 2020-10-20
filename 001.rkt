#lang racket
(stream-fold + 0
 (stream-filter
  (lambda (x) (or (= 0 (modulo x 3)) (= 0 (modulo x 5))))
  (in-range 0 1000 1)))