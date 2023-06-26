#lang racket

(require racket/block)

(define (hello name)
  (printf "Hello, ~a\n" name))

(define person-name "안유찬")
(hello person-name)

(block
 (define hi "hi")
 (displayln hi))

;; (displayln hi) ;; <-- error

(if #t
    (displayln "true")
    (displayln "false"))
(if #f
    (displayln "true")
    (displayln "false"))

(block
 (display ">> ")
 (define input (read-line))
 (printf "your input: ~a\n" input))

(block
 (display "Hello!\n>> ")
 (define input (read-line))
 (if (or (string-prefix? (string-downcase input) "hi")
         (string-prefix? (string-downcase input) "hello")
         (string-prefix? (string-downcase input) "안녕"))
     (displayln "Nice to meet you!")
     (displayln "What??")))
