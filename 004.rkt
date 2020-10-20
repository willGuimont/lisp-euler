#lang racket

(define (reverse-string s) (list->string (reverse (string->list s))))

(define (is-palindrome x) (let ((s (~a x))) (equal? s (reverse-string s))))

(define xs (range 100 1000 1))

(apply
 max
 (filter
  is-palindrome
  (map
   (lambda (x) (apply * x))
   (cartesian-product xs xs))))

