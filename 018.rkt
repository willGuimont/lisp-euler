#lang racket
(define numbers
  '(75 95 64 17 47 82 18 35 87 10 20 04 82 47 65 19
    01 23 75 03 34 88 02 77 73 07 63 67 99 65 04 28
    06 16 70 92 41 41 26 56 83 40 80 70 33 41 48 72
    33 47 32 37 16 94 29 53 71 44 65 25 43 91 52 97
    51 14 70 11 33 28 77 73 17 78 39 68 17 57 91 71
    52 38 17 14 91 43 58 50 27 29 48 63 66 04 68 89
    53 67 30 73 16 69 87 40 31 04 62 98 27 23 09 70
    98 73 93 38 53 60 04 23))

(define (triangle)
  (define (iter n xs)
    (cond [(= 0 (length xs)) '()]
          [else
           (cons (take xs n) (iter (add1 n) (drop xs n)))]))
  (iter 1 numbers))

(define (empty-world n)
  (define (iter i)
    (let ([xs (build-list i (lambda (x) 0))])
      (cond [(= i n) (list xs)]
          [else
           (cons xs (iter (add1 i)))])))
  (iter 1))

(define (set-at xs n e)
  (cond [(>= n (length xs)) xs]
        [else (append (take xs n) (list e) (drop xs (add1 n)))]))

(define (solve world)
  (define (build-table n i all-lines current-line table)
    (cond [(= n (length world)) table]
          [(= i (add1 n)) (build-table (add1 n) 0 (drop all-lines 1) (first current-line) table)]
          [else
           (let ([new-table table])
             (build-table n (add1 i) all-lines (first all-lines) new-table))]))
  (+ 1 2))