#lang racket

(define day "01")

(define input
  (let ([s (port->string (open-input-file (string-append day ".in.txt")) #:close? #t)])
    (map string->number (string-split s))))

(define (windows l size)
  (map (λ (offset) (take (drop l offset) size)) (inclusive-range 0 (- (length l) size))))

(define part1
  (count ((curry apply) <) (windows input 2)))

(define part2
  (let
    ([sums (map ((curry apply) +) (windows input 3))])
    (count
      ((curry apply) <) (windows sums 2))))
