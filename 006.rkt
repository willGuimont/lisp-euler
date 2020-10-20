#lang racket

(define (sum xs) (foldl + 0 xs))

(define xs (range 1 101))

(- (expt (sum xs) 2) (sum (map (lambda (x) (expt x 2)) xs)))