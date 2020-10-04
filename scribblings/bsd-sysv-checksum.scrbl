#lang scribble/manual
@require[@for-label[bsd-sysv-checksum
                    racket/base]]

@title{bsd-sysv-checksum}
@author{David Wilson}

@defmodule[bsd-sysv-checksum]

Allows for calculation of BSD and System V checksums of files. Uses code from GNU Coreutils and
gnulib.

@table-of-contents[]

@section[#:tag "Usage"]{Usage}
> (require bsd-sysv-checksum)

> (get-bsd-sum "main.rkt")
'("59899" 2)

> (get-sysv-sum "main.rkt")
'("15444" 4)

get-bsd-sum and get-sysv-sum both return a list of two elements:

1. The checksum
2. The number of blocks in the file (512-byte blocks for sysv-sum; 1024-byte blocks for bsd-sum)

