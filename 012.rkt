#lang racket
(require racket/stream)
(require math/number-theory)
(require memoize)

(define/memo (nth-triangle-number n)
  (if (= n 0)
      0
      (+ n (nth-triangle-number (sub1 n)))))

(define (triangle-numbers)
   (define (iter n) (stream-cons (nth-triangle-number n) (iter (add1 n))))
   (iter 0))

(define (num-divisor n)
  (length (divisors n)))

(stream-first
 (stream-filter
  (lambda (x) (> (num-divisor x) 500))
  (triangle-numbers)))