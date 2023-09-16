;;;; Learn Racket
;;; TODO:
;;; - learn typed racket:
;;;   - https://docs.racket-lang.org/ts-guide/
;;;   - https://docs.racket-lang.org/ts-reference/index.html
;;; - learn module system: https://docs.racket-lang.org/guide/modules.html
;;; - learn package manager: https://docs.racket-lang.org/pkg/index.html

#lang typed/racket

(require racket/block
         math/array)


;; function and variable
(define (hello name)
  (printf "Hello, ~a\n" name))
(define hello2 (lambda name
                 (printf "Hello, ~a\n" name)))

(define person-name "John")
(hello person-name)
(set! person-name "Steve") ; <-- variables can be mutated via `set!`
(hello2 person-name)


;; scoped variable
(let ()
  (define hi "hi")
  (displayln hi))

(let ((hi "hi"))
  (displayln hi))

(local
  ((define hi "hi"))
  (displayln hi))

(block
 (define hi "hi")
 (displayln hi))

;; (displayln hi) ;; <-- error: `hi: unbound identifier`


;; character
;; https://docs.racket-lang.org/guide/characters.html#%28tech._character%29
(displayln #\A)
(displayln #\uC548) ;; <-- 안


;; string
(for ([ch "안녕"])
  (println ch))


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
 (when (not (eof-object? input))
   (printf "your input: ~a\n" input)
   (let ((last-char (string-ref input (sub1 (string-length input)))))
     (printf "last character: ~a\n" (char->integer last-char))))) ; <-- on windows the last character is '\r'


(block
 (display "Hello!\n>> ")
 (define raw-input (read-line))
 (when (not (eof-object? raw-input))
   (define input (string-downcase raw-input))
   (if (or (string-prefix? input "hi")
           (string-prefix? input "hello")
           (string-prefix? input "안녕"))
       (displayln "Nice to meet you!")
       (displayln "Ok bye..."))))


;; list
(block
 (display "(list 1 2 3) and '(1 2 3) is ")
 (if (equal? (list 1 2 3) '(1 2 3))
     (displayln "equal")
     (displayln "not equal"))

 ;; multiple types of items can be stored
 (define some-list '(1 #\a 3.3))
 (displayln some-list))


;; vector
;; https://docs.racket-lang.org/reference/vectors.html
;; fxvector: https://docs.racket-lang.org/reference/fixnums.html#%28tech._fxvector%29
;; flvector: https://docs.racket-lang.org/reference/flonums.html#%28part._flvectors%29
(block
 ;; vector is a one dimensional storage
 (display "(vector 1 2 3) and #(1 2 3) is ")
 (if (equal? (vector 1 2 3) #( 1 2 3))
     (displayln "equal")
     (displayln "not equal"))

 ;; multiple types of items can be stored
 (define some-vec #(1 #\a 3.3))
 (displayln some-vec)

 ;; vector indexing
 (define v #(1 2 3))
 (printf "v[1] = ~a\n" (vector-ref v 1)))


;; for loop
(block
 (for ([i 3])
   (print i)) ; 0 ~ 2
 (newline)

 (for ([i '(1 2 3)])
   (print i))
 (newline)

 ;; for/list returns a list (similar to map)
 (println
  (for/list : (Listof Integer) ([i '(1 2 3)])
    (* i 2))))


;; array
;; https://docs.racket-lang.org/math/array.html
(block
 ;; array is a >=1 dimensional storage
 (define arr (array #[0 1 2 3]))
 (println arr)

 (define arr2d (array #[#[0 1 2 3]
                        #[4 5 6 7]]))
 (println arr2d)

 ;; array indexing
 (printf "arr[2] = ~a\n" (array-ref arr #(2)))
 (printf "arr2d[1][2] = ~a\n" (array-ref arr2d #(1 2)))

 ;; loop through array
 (for ([i (in-array arr)])
   (displayln i))

 ;; multiple types of items can be stored
 (define some-arr (array #[0 #\a 3.3]))
 (println some-arr))


;; struct
;; you cannot define struct in a block
(struct point ([x : Number]
               [y : Number]))
(block
 (define p (point 1.2 3.0))
 (printf "p.x = ~a\np.y = ~a\n" (point-x p) (point-y p)))

;; define-struct
(define-struct human ([name : String]
                      [age : Integer]))
(block
 (define some-human (make-human "John" 20))
 (println (human-name some-human))
 ;;        ^^^^^^^^^^^^^^^^^^^^^ --> access struct field `name` of `some-human`
 (println (human-age some-human))

 (if (human? some-human)
     (displayln "it is a human")
     (displayln "it is not a human"))

 (if (human? "hello")
     (displayln "it is a human")
     (displayln "it is not a human")))
