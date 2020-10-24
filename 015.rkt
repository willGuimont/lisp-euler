#lang racket

(define (! n)
  (define (iter n c)
    (if (= n 1)
        c
        (iter (sub1 n) (* n c))))
  (iter n 1))

(define (binomial-coeff n k)
  (if (and (<= 0 k) (< k n))
      (/ (! n) (* (! k) (! (- n k))))
      0))

(binomial-coeff 40 20)