#lang racket
(require math/number-theory)

(apply
 max
  (map
   (lambda (x) (first x))
   (factorize 600851475143)))
