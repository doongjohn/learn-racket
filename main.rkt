#lang typed/racket

(require racket/block)


;; function and variable
(define (hello name)
  (printf "Hello, ~a\n" name))

;; there is no immutable variable in racket
(define person-name "John")
(hello person-name)
(set! person-name "Steve")
(hello person-name)


;; scoped variable
(let ()
  (define hi "hi")
  (displayln hi))

(local
  ((define hi "hi"))
  (displayln hi))

(block
 (define hi "hi")
 (displayln hi))

;; (displayln hi) ;; <-- error: `hi: unbound identifier`


;; if else
(if #t
    (displayln "true")
    (displayln "false"))
(if #f
    (displayln "true")
    (displayln "false"))


;; read-line
(block
 (display ">> ")
 (define input (read-line))
 (printf "your input: ~a\n" input))

(block
 (display "Hello!\n>> ")
 (define input (read-line))
 (when (not (eof-object? input))
   (if (or (string-prefix? (string-downcase input) "hi")
           (string-prefix? (string-downcase input) "hello")
           (string-prefix? (string-downcase input) "안녕"))
       (displayln "Nice to meet you!")
       (displayln "What??"))))


;; list
(display "(list 1 2 3) and '(1 2 3) is ")
(if (equal? '(1 2 3) (list 1 2 3))
    (displayln "equal")
    (displayln "not equal"))


;; loop
(for ([i 3])
  (print i)) ; 0 ~ 2
(newline)

(for ([i '(1 2 3)])
  (print i))
(newline)

;; for/list returns a list
(println (for/list : (Listof Integer) ([i '(1 2 3)])
           (* i 2)))
