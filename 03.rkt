#lang racket

(require racket/undefined)

(define day "03")
(define input-path (string-append day ".in.txt"))
; (define input-path (string-append day ".ex.txt"))

(define input
  (call-with-input-file input-path (λ (in)
    (for/list ([line (port->lines in)])
      (for/list ([char (string->list line)])
        (case char
          [(#\1) 1]
          [(#\0) 0]))))))

(define (binary-digits->number digits)
  (for/fold ([n 0]) ([digit digits])
    (+ digit (* 2 n))))

(define (transpose table)
  (for/list ([i (in-range (length (first table)))])
    (for/list ([row table])
      (list-ref row i))))

(define (occurrences sequence)
  (for/fold ([0-count 0] [1-count 0]) ([d sequence])
    (case d
      [(0) (values (+ 1 0-count) 1-count)]
      [(1) (values 0-count (+ 1 1-count))])))

(define (commonality sequence)
  (let-values ([(0-count 1-count) (occurrences sequence)])
    (cond
      [(< 0-count 1-count) (values 1 0)]
      [(> 0-count 1-count) (values 0 1)]
      [else null])))

(define (gamma readings)
  (binary-digits->number
    (for/list ([column (transpose readings)])
      (let-values ([(most-common least-common) (commonality column)])
        most-common))))

(define (epsilon readings)
  (binary-digits->number
    (for/list ([column (transpose readings)])
      (let-values ([(most-common least-common) (commonality column)])
        least-common))))

(define part1
  (* (gamma input) (epsilon input)))

(define part2 undefined)
