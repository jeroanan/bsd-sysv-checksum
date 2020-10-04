#lang racket/base

(provide pre-installer)

(require racket/file
         racket/system)
(require file/untgz)

(define (pre-installer collections-top-path racl-path)
  (define private-path (build-path racl-path "private"))
  (define unpacked-path (path->string (build-path private-path "gnulib")))
  (define gnulib-objects (path->string build-path private-path "gnulib" "*.o"))

  (define fadvise-path (path->string (build-path private-path "fadvise" "fadvise.c")))
  (define fadvise-output-path (path->string (build-path private-path "fadvise.o")))

  (define sum-path (path->string (build-path private-path "sum.c")))
  (define sum-output-path (path->string (build-path private-path "sum.o")))

  (define output-path (path->string (build-path private-path "sum.so")))
  
  
  (untgz (build-path private-path "gnulib.tgz") #:dest private-path)
  (system (string-append "cd " unpacked-path " && ./configure && make"))
  #;(system (string-append
           "gcc "unpacked-path"/gllib/*.o -I "unpacked-path" -shared -o "output-path))
  (system (string-append "gcc -c -fPIC "fadvise-path" -o "fadvise-output-path))
  (system (string-append "gcc -c -fPIC "sum-path" -o"sum-output-path" -I"unpacked-path))
  (system (string-append "gcc "sum-output-path" "fadvise-output-path" "gnulib-objects" -shared -o "output-path" -I"unpacked-path))
  
  (delete-directory/files unpacked-path))


  
  
