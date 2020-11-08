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
  (define (iter n xs c)
    (cond [(= 0 (length xs)) c]
          [else
           (iter (add1 n) (drop xs n) (vector-append c (vector (apply vector (take xs n)))))]))
  (iter 1 numbers (list->vector '())))



(define (solve world)
  (define (empty-table n)
    (define (iter i c)
      (let ([xs (vector (apply vector (build-list i (lambda (x) 0))))])
        (cond [(= i (add1 n)) c]
              [else
               (iter (add1 i) (vector-append c xs))])))
    (iter 1 (list->vector '())))
  
  (define (get-at-or-0 n i xs)
    (cond [(or (< n 0) (>= n (vector-length xs))) 0]
          [(or (< i 0) (>= i (vector-length (vector-ref xs n)))) 0]
          [else (vector-ref (vector-ref xs n) i)]))
  
  (define (build-table n i table)
    (cond [(= n (vector-length world)) table]
          [(= i (add1 n)) (build-table (add1 n) 0 table)]
          [else
           (vector-set! (vector-ref table n) i (+ (get-at-or-0 n i world) (max (get-at-or-0 (sub1 n) (sub1 i) table) (get-at-or-0 (sub1 n) i table))))
           (build-table n (add1 i) table)]))
  
  (define (max-index xs)
    (define (iter ys m mi i)
      (cond [(empty? ys) mi]
            [(> (car ys) m) (iter (cdr ys) (car ys) i (add1 i))]
            [else (iter (cdr ys) m mi (add1 i))]))
    (iter (vector->list xs) -inf.0 -1 0))
  
  (let
      [(table
        (build-table 0 0 (empty-table (vector-length world))))]
    (let
        [(n (sub1 (vector-length table)))]
      (let
          [(i (max-index (vector-ref table n)))]
      (get-at-or-0 n i table)))))


(solve (triangle))