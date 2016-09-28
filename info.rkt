#lang info

(define collection "cond-strict")

(define deps
  '("base"
    ))

(define build-deps
  '("rackunit-lib"
    "racket-doc"
    "scribble-lib"
    ))

(define scribblings
  '(["scribblings/cond-strict.scrbl" ()]))

