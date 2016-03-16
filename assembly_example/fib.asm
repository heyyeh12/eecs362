; Start instrs at address 0
.text 0x0000
; Start data somewhere else
.data 0x2000
.global _f
_f:
.word 0
.word 1

; Instructions
.text


; Fibonacci: f[i] = f[i-2] + f[i-1]; f[0]=0, f[1]=1
.proc _fib
.global _fib
_fib:
    ; Initialize r1-r2
    lw r1, _f(r0)               ; 8c 01 20 00
    lw r2, (_f + 4)(r0)         ; 8c 02 20 04
    ; r3 = 'i'
    xor r3, r3, r3 ; i=0        ; 00 63 18 26
    addui r3, r3, #8 ; i=2      ; 24 63 00 08
fibr1:
    addu r1, r1, r2 ; a=(a+b)   ; 00 22 08 2
    sw _f(r3), r1   ; f[i] = a  ; ac 61 20 00 
    addui r3, r3, #4 ; i++      ; 24 63 00 04 
    addu r2, r1, r2 ; b=(a+b)   ; 00 22 10 21 
    sw _f(r3), r2   ; f[i] = b  ; ac 62 20 00
    addui r3, r3, #4 ; i++      ; 24 63 00 04 
    sgei r4, r3, #0xb4          ; 74 64 00 b4 
    ; 0xb4 = 180 = 45*4
    ; much higher, and the number runs out of bits
    beqz r4, fibr1              ; 10 80 ff e0
    nop ; delay slow            ; 00 00 00 15 
    trap #0x300                 ; 44 00 03 00 

.endproc _fib
