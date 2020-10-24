#lang racket

(foldl + 0
       (map
        (compose string->number list->string list)
        (string->list (number->string (expt 2 1000)))))