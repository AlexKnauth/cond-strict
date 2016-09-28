#lang racket/base

(provide cond/strict)

(require (for-syntax racket/base))

;; A version of cond that raises an error when all the clause
;; conditions return false, instead of returning #<void>

(define-syntax cond/strict
  (lambda (stx)
    (syntax-case stx (else)
      [(cond/strict clause ... [else . else-body])
       (syntax/loc stx (cond clause ... [else . else-body]))]
      [(cond/struct clause ...)
       (with-syntax ([err (syntax/loc stx (error 'cond "all clause conditions were false"))])
         (syntax/loc stx (cond clause ... [else err])))])))

