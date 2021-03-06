#lang racket

(#%require "basic.scm")
(#%require "prime.scm")
; Export package
(provide (all-defined-out))

(define (next-odd n)
    (if (odd? n)
        (+ 2 n)
        (+ 1 n)))

(define (successive-primes n count)
    (cond ((= count 0)
            (display "are primes.\n")
            (display "Time elapsed in millisecond:\n"))
          ((prime? n)
            (display n)
            (newline)
            (successive-primes (next-odd n) (- count 1)))
          (else
            (successive-primes (next-odd n) count))))

(define (search-for-primes n)
  (time (successive-primes n 3))
  (newline))