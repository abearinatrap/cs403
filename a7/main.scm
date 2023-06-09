(define (split-string str)
  (let ((words '())
        (word '()))
    (let loop ((i 0))
      (cond ((>= i (string-length str))
             (if (not (null? word))
                 (set! words (append words (list (list->string (reverse word))))))
             words)
            ((char=? (string-ref str i) #\space)
             (if (not (null? word))
                 (set! words (append words (list (list->string (reverse word))))))
             (set! word '())
             (loop (+ i 1)))
            (else
             (set! word (cons (string-ref str i) word))
             (loop (+ i 1)))))))

(define lines '())
(define pi (* 4 (atan 1 1)))
(define skip 0)
(define (perform command filen . args)
    (set! skip 0)
    (if (not (file-exists? filen)) (begin (display (string-append "\nUnable to open " filen " for reading.\n\n")) (set! skip 1) (display (number->string skip))) ( ))
    (if (= skip 1) () (
        (let ((input-port (open-input-file filen)))
            (set! lines ())
            (set! skip 0)
            (let loop ((line (read-line input-port)))
            (cond ((eof-object? line)
                (close-input-port input-port)
                'done)
            (else
                ; (display line)
                ; (display (split-string line))
                (set! line (string-trim-right line))
                (let (
                    (linearr (split-string line)) (outputarr '()) (addl 0)) 
                    (set! outputarr (append outputarr (list (list-ref linearr 0))))
                    (set! outputarr (append outputarr (list (list-ref linearr 1))))
                    (if (equal? (list-ref outputarr 1) "box") (let 
                        (
                            (output "Box: ")
                            (width (string->number (list-ref linearr 2))) 
                            (dlength (string->number (list-ref linearr 3))) 
                            (height (string->number (list-ref linearr 4)))
                        )
                        (let (
                            (volume (* width dlength height))
                            (area (+ (* 2(* width dlength)) (* 2 (* width height)) (* 2 (* dlength height))))
                        )
                        (set! outputarr (append outputarr (list area)))
                        (set! outputarr (append outputarr (list volume)))
                        (set! output (string-append output (list-ref linearr 0)))
                        (set! output (string-append output ", Length="))
                        (set! output (string-append output (number->string dlength)))
                        (set! output (string-append output ", Width="))
                        (set! output (string-append output (number->string width)))
                        (set! output (string-append output ", Height="))
                        (set! output (string-append output (number->string height)))
                        (set! output (string-append output "\n\tSurface Area: "))
                        (set! output (string-append output (number->string area)))
                        (set! output (string-append output ", Volume: "))
                        (set! output (string-append output (number->string volume)))
                        (set! outputarr (append outputarr (list output)))
                        )
                        ;(display height)
                    ))
                    (if (equal? (list-ref outputarr 1) "sphere") (let 
                        (
                            (output "Sphere: ")
                            (radius (string->number (list-ref linearr 2)))
                        )
                        (let (
                            (volume (/ (* 4 radius radius radius pi) 3))
                            (area (* 4 radius radius pi))
                        )
                        (set! outputarr (append outputarr (list area)))
                        (set! outputarr (append outputarr (list volume)))
                        (set! output (string-append output (list-ref linearr 0)))
                        (set! output (string-append output ", Radius="))
                        (set! output (string-append output (number->string radius)))
                        (set! output (string-append output "\n\tSurface Area: "))
                        (set! output (string-append output (number->string area)))
                        (set! output (string-append output ", Volume: "))
                        (set! output (string-append output (number->string volume)))
                        (set! outputarr (append outputarr (list output)))
                        )
                        ;(display height)
                    ))
                    (if (equal? (list-ref outputarr 1) "cylinder") (let 
                        (
                            (output "Cylinder: ")
                            (radius (string->number (list-ref linearr 2)))
                            (height (string->number (list-ref linearr 3)))
                        )
                        (let (
                            (volume (* pi radius radius height))
                            (area (+ (* 2 pi radius height) (* 2 pi radius radius)))
                        )
                        (set! outputarr (append outputarr (list area)))
                        (set! outputarr (append outputarr (list volume)))
                        (set! output (string-append output (list-ref linearr 0)))
                        (set! output (string-append output ", Radius="))
                        (set! output (string-append output (number->string radius)))
                        (set! output (string-append output ", Height="))
                        (set! output (string-append output (number->string height)))
                        (set! output (string-append output "\n\tSurface Area: "))
                        (set! output (string-append output (number->string area)))
                        (set! output (string-append output ", Volume: "))
                        (set! output (string-append output (number->string volume)))
                        (set! outputarr (append outputarr (list output)))
                        )
                        ;(display height)
                    ))
                    (if (equal? (list-ref outputarr 1) "torus") (let 
                        (
                            (output "Torus: ")
                            (radius (string->number (list-ref linearr 2)))
                            (bigradius (string->number (list-ref linearr 3)))
                        )
                        (let (
                            (volume (* 2 pi pi radius radius bigradius))
                            (area (* 4 pi pi bigradius radius))
                        )
                        (set! outputarr (append outputarr (list area)))
                        (set! outputarr (append outputarr (list volume)))
                        (set! output (string-append output (list-ref linearr 0)))
                        (set! output (string-append output ", Small Radius="))
                        (set! output (string-append output (number->string radius)))
                        (set! output (string-append output ", Big Radius="))
                        (set! output (string-append output (number->string bigradius)))
                        (set! output (string-append output "\n\tSurface Area: "))
                        (set! output (string-append output (number->string area)))
                        (set! output (string-append output ", Volume: "))
                        (set! output (string-append output (number->string volume)))
                        (set! outputarr (append outputarr (list output)))
                        )
                        ;(display height)
                    ))
                    ; first element of output arr is name
                    ; second is type
                    ; third is area, calculated now based off of type
                    ; fourth is volume, calculated now
                    ; fifth element is the string printed out when showing it

                    ; if statement to check if shape should be added or not
                    (if (= 1 (/ (length args) 3))
                        (let loop ((i 0) (n (length args))) 
                            (cond ((> i (- n 3)) '0)
                            (else 
                                (let ((type (list-ref args i)) (op (list-ref args (+ i 1))) (val (list-ref args (+ i 2))))
                                    (if (string=? type "type") 
                                        (let () 
                                            (if (string=? op "!=") 
                                                (if (string=? (list-ref outputarr 1) val) (set! addl 1))
                                            )
                                            (if (string=? op "==") 
                                                (if (string=? (list-ref outputarr 1) val) () (set! addl 1))
                                            )
                                            (if (string=? op "<") 
                                                (if (string<? (list-ref outputarr 1) val) () (set! addl 1))
                                            )
                                            (if (string=? op "<=") 
                                                (if (string<=? (list-ref outputarr 1) val) () (set! addl 1))
                                            )
                                            (if (string=? op ">") 
                                                (if (string>? (list-ref outputarr 1) val) () (set! addl 1))
                                            )
                                            (if (string=? op ">=") 
                                                (if (string>=? (list-ref outputarr 1) val) () (set! addl 1))
                                            )
                                        )
                                    )
                                    ;(set! val (string->number val))
                                    (if (string=? type "area") 
                                        (let () 
                                            (if (string=? op "!=") 
                                                (if (= (list-ref outputarr 2) val) (set! addl 2))
                                            )
                                            (if (string=? op "==") 
                                                (if (= (list-ref outputarr 2) val) () (set! addl 2))
                                            )
                                            (if (string=? op "<") 
                                                (if (< (list-ref outputarr 2) val) () (set! addl 2))
                                            )
                                            (if (string=? op "<=") 
                                                (if (<= (list-ref outputarr 2) val) () (set! addl 2))
                                            )
                                            (if (string=? op ">") 
                                                (if (> (list-ref outputarr 2) val) () (set! addl 2))
                                            )
                                            (if (string=? op ">=") 
                                                (if (>= (list-ref outputarr 2) val) () (set! addl 2))
                                            )
                                        )
                                    )
                                    (if (string=? type "volume") 
                                        (let () 
                                            (if (string=? op "!=") 
                                                (if (= (list-ref outputarr 3) val) (set! addl 3))
                                            )
                                            (if (string=? op "==") 
                                                (if (= (list-ref outputarr 3) val) () (set! addl 3))
                                            )
                                            (if (string=? op "<") 
                                                (if (< (list-ref outputarr 3) val) () (set! addl 3))
                                            )
                                            (if (string=? op "<=") 
                                                (if (<= (list-ref outputarr 3) val) () (set! addl 3))
                                            )
                                            (if (string=? op ">") 
                                                (if (> (list-ref outputarr 3) val) () (set! addl 3))
                                            )
                                            (if (string=? op ">=") 
                                                (if (>= (list-ref outputarr 3) val) () (set! addl 3))
                                            )
                                        )
                                    )
                                )
                                (loop (+ i 3) n)
                            ))
                        )
                        ;(let () (display "Incorrect number of arguments.\n") (set! skip 1))
                        (if (zero? (length args)) () (if (zero? skip) (let () (display "Incorrect number of arguments.\n") (set! skip 1))))
                    )
                    
                    (if (equal? addl 0) (set! lines (append lines (list outputarr))))
                    
                )
                ;(set! lines (cons (split-string line) lines))
                (loop (read-line input-port))))))
        ;(display lines)
        (if (= skip 1) () (let () 
            (if (string=? command "count") (let ((output "There are ")) 
                (newline)
                (set! output (string-append output (number->string (length lines))))
                (set! output (string-append output " shapes."))
                (display output)
                (newline)
            ))
            (if (string=? command "print") (let () 
                (newline)
                (let loop ((i 0) (n (length lines))) 
                    (cond ((> i (- n 1)) '0)
                    (else 
                        (display (list-ref (list-ref lines i) 4))
                        (newline)
                        (loop (+ i 1) n)
                    ))
                )
            ))
            (if (string=? command "total") (let ((totala 0) (totalv 0) (output "total(Surface Area)="))
                (newline)
                (let loop ((i 0) (n (length lines))) 
                    (cond ((> i (- n 1)) '0)
                    (else 
                        (set! totala (+ totala (list-ref (list-ref lines i) 2) ))
                        (set! totalv (+ totalv (list-ref (list-ref lines i) 3) ))

                        (loop (+ i 1) n)
                    ))
                )
                (set! output (string-append output (number->string totala)))
                (set! output (string-append output "\ntotal(Volume)="))
                (set! output (string-append output (number->string totalv)))
                (display output)
                (newline)
            ))
            (if (string=? command "avg") (let ((totala 0) (totalv 0) (output "avg(Surface Area)=")) 
                (newline)
                (let loop ((i 0) (n (length lines))) 
                    (cond ((> i (- n 1)) '0)
                    (else 
                        (set! totala (+ totala (list-ref (list-ref lines i) 2) ))
                        (set! totalv (+ totalv (list-ref (list-ref lines i) 3) ))

                        (loop (+ i 1) n)
                    ))
                )
                (set! output (string-append output (number->string (/ totala (length lines)))))
                (set! output (string-append output "\navg(Volume)="))
                (set! output (string-append output (number->string (/ totalv (length lines)))))
                (display output)
                (newline)
            ))
            (if (string=? command "min") (let ((ma 0) (mv 0) (output "min(Surface Area)=")) 
                (newline)
                (set! ma (list-ref (list-ref lines 0) 2))
                (set! mv (list-ref (list-ref lines 0) 3))
                (let loop ((i 1) (n (length lines))) 
                    (cond ((> i (- n 1)) '0)
                    (else 
                        (if (> ma (list-ref (list-ref lines i) 2)) (set! ma (list-ref (list-ref lines i) 2) ))
                        (if (> mv (list-ref (list-ref lines i) 3)) (set! mv (list-ref (list-ref lines i) 3) ))
                        (loop (+ i 1) n)
                    ))
                )
                (set! output (string-append output (number->string ma)))
                (set! output (string-append output "\nmin(Volume)="))
                (set! output (string-append output (number->string mv)))
                (display output)
                (newline)
            ))
            (if (string=? command "max") (let ((ma 0) (mv 0) (output "max(Surface Area)=")) 
                (newline)
                (set! ma (list-ref (list-ref lines 0) 2))
                (set! mv (list-ref (list-ref lines 0) 3))
                (let loop ((i 1) (n (length lines))) 
                    (cond ((> i (- n 1)) '0)
                    (else 
                        (if (< ma (list-ref (list-ref lines i) 2)) (set! ma (list-ref (list-ref lines i) 2) ))
                        (if (< mv (list-ref (list-ref lines i) 3)) (set! mv (list-ref (list-ref lines i) 3) ))
                        (loop (+ i 1) n)
                    ))
                )
                (set! output (string-append output (number->string ma)))
                (set! output (string-append output "\nmax(Volume)="))
                (set! output (string-append output (number->string mv)))
                (display output)
                (newline)
            ))
        ))
    ))
)
