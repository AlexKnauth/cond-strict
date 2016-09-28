#lang scribble/manual

@(require scribble/eval
          (for-label racket/base
                     cond-strict
                     ))

@title{@racket[cond]: what it should have been}

@defmodule[cond-strict]{
This module provides @racket[cond/strict], a version of @racket[cond]
that raises an error when all the clause conditions return false,
instead of returning @|void-const|.
}

@defform[#:literals (else =>)
  (cond/strict condclause ...)
  #:grammar ([cond-clause [test-expr then-body ...+]
                          [else then-body ...+]
                          [test-expr => proc-expr]
                          [test-expr]])]{
Exactly like @racket[cond], except for one thing:

If there is no @racket[else] clause and every @racket[test-expr]
returns false, @racket[cond/strict] raises an error instead of
returning @|void-const|.

@examples[
  (require cond-strict)
  (cond/strict
    [else 5])
  (cond/strict
    [#false 42]
    [else 5])
  (cond/strict
    [#false 42])
  (cond/strict
    [(positive? -5) (error "doesn't get here")]
    [(zero? -5) (error "doesn't get here, either")]
    [(positive? 5) 'here])
  (cond/strict
    [(member 2 '(1 2 3)) => (lambda (l) (map - l))])
  (cond/strict
    [(member 2 '(1 2 3))])
  (cond/strict
    [(member 9.75 '(1 2 3)) 42])
]}

