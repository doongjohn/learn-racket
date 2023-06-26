#lang racket


;; function and variable
(define (hello name)
  (printf "Hello, ~a\n" name))

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

(require racket/block)
(block
 (define hi "hi")
 (displayln hi))

;; (displayln hi) ;; <-- error


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
 (if (or (string-prefix? (string-downcase input) "hi")
         (string-prefix? (string-downcase input) "hello")
         (string-prefix? (string-downcase input) "안녕"))
     (displayln "Nice to meet you!")
     (displayln "What??")))


;; loop
(for ([i (list 1 2 3)])
  (println i))
