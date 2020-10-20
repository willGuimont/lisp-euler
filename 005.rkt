#lang racket
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (modulo a b))))

(define (lcm a b) (/ (* a b) (gcd a b)))

(foldl lcm 1 (range 1 21))