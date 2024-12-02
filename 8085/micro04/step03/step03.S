#define __SFR_OFFSET 0
#include "avr/io.h"
.global mycode
mycode:
 sbi DDRB, 5 ; Set PB5 to output (connects to Arduino Uno pin 13)

 
blink:
 sbi PINB, 5 ; Toggle PINB
 ldi r29, hi8(500) ; load high-order byte to r29
 ldi r28, lo8(500) ; load low-order byte to r28
 call delay_ms
 jmp blink

 
delay_ms:
 ; Delays by approximately (r29:r28) ms.
 ; System clock of 16 MHz means that 16000 cycles need 1 ms
; Each iteration of the inner loop requires 4 cycles
 ; therefore r31:r30=4000 iterations are required
 ldi r31, hi8(4000)
 ldi r30, lo8(4000)
 ; Inner loop reduces (r31:r30)
inner:
 sbiw r30, 1
 brne inner
 sbiw r28, 1
 ; Outer loop reduces (r29:r28)
 brne delay_ms
 ret
