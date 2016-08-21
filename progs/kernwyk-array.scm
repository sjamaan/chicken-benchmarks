;;; ARRAY1 -- One of the Kernighan and Van Wyk benchmarks.
;;; http://cm.bell-labs.com/cm/cs/who/bwk/interps/pap.html

(define (create-x n)
  (define result (make-vector n))
  (do ((i 0 (+ i 1)))
      ((>= i n) result)
    (vector-set! result i i)))

(define (create-y x)
  (let* ((n (vector-length x))
         (result (make-vector n)))
    (do ((i (- n 1) (- i 1)))
        ((< i 0) result)
      (vector-set! result i (vector-ref x i)))))

(define (my-try n)
  (vector-length (create-y (create-x n))))

(define (go m n)
  (let loop ((repeat m)
             (result '()))
    (if (> repeat 0)
        (loop (- repeat 1) (my-try n))
        result)))

(time (go 100 500000))
