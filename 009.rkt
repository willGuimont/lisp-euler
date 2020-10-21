#lang racket

(define (triplet? a b c)
  (=
   (+ (expt a 2) (expt b 2))
   (expt c 2)))

(define (sum? a b c)
  (= 100 (+ a b c)))

(define triplet '(0 0 0))
(for ([i (range 1 1000)])
  (for ([j (range i 1000)])
    (let ([k (- 1000 (+ i j))])
      (when (and (triplet? i j k))
        (set! triplet `(,i ,j ,k))))))

(foldl * 1 triplet)



