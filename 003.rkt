#lang racket
(require memoize)
(require racket/stream)
(require math/number-theory)

(apply
 max
  (map
   (lambda (x) (first x))
   (factorize 600851475143)))
