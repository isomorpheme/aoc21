#lang racket

(require racket/undefined)

(define day "xx")

(define input
  (let ([s (port->string (open-input-file (string-append day ".in.txt")) #:close? #t)])
    (map string->number (string-split s))))

(define part1 undefined)

(define part2 undefined)
