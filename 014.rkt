#lang racket
(require memoize)

(define (collatz n)
  (if (even? n)
      (/ n 2)
      (+ (* 3 n) 1)))

(define/memo (collatz-chain n)
  (cond
    [(<= n 0) '()]
    [(= n 1) '(1)]
    [else (cons n (collatz-chain (collatz n)))]))

(define (max x y)
  (if (> (second y) (second x))
      y
      x))

(stream-fold max '(0 0)
       (for/stream ([i (range 1 1000000)])
                  `(,i ,(length (collatz-chain i)))))