#lang racket
(require memoize)
(require racket/stream)

(define/memo (fibo n a b)
  (if (zero? n)
      a
      (fibo (sub1 n) b (+ a b))))

(stream-fold
 +
 0
 (stream-filter
  (lambda (x) (and (< x 4000000) (zero? (modulo x 2))))
  (stream-map
   (lambda (i) (fibo i 1 1))
   (in-range 0 1000 1))))