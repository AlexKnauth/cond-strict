cond-strict
===
A version of [`cond`][cond] that raises an error when all the clause
conditions return false, instead of returning `#<void>`

```racket
> (require cond-strict)
> (cond/strict
    [else 5])
5
> (cond/strict
    [#false 42]
    [else 5])
5
> (cond/strict
    [#false 42])
;cond: all clause conditions were false
> (cond/strict
    [(positive? -5) (error "doesn't get here")]
    [(zero? -5) (error "doesn't get here, either")]
    [(positive? 5) 'here])
'here
> (cond/strict
    [(member 2 '(1 2 3)) => (lambda (l) (map - l))])
(list -2 -3)
> (cond/strict
    [(member 2 '(1 2 3))])
(list 2 3)
> (cond/strict
    [(member 9.75 '(1 2 3)) 42])
;cond: all clause conditions were false
```

  [cond]: http://docs.racket-lang.org/reference/if.html#%28form._%28%28lib._racket%2Fprivate%2Fletstx-scheme..rkt%29._cond%29%29
