bsd-sysv-checksum
=================

This package takes code from GNU Coreutils and gnulib and allows for 
calculation of BSD and SYSV checksums of files using Racket.

## Usage
> (require bsd-sysv-checksum)

> (get-bsd-sum "main.rkt")
'("59899" 2)

> (get-sysv-sum "main.rkt")
'("15444" 4)

get-bsd-sum and get-sysv-sum both return a list of two elements:

1. The checksum
2. The number of blocks in the file (512-byte blocks for sysv-sum; 1024-byte blocks for bsd-sum)
