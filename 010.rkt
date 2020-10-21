#lang racket
(require math/number-theory)
(require racket/stream)

(define (primes-under n)
  (if (> n 2)
      (let ([pn (prev-prime n)])
        (stream-cons pn (primes-under pn)))
      '()))

(stream-fold + 0 (primes-under 2000000))