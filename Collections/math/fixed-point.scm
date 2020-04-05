#lang racket

(#%require "basic.scm")
; Export package
(provide (all-defined-out))

; Fixed-point finding
(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))