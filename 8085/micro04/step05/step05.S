#define __SFR_OFFSET 0
#include "avr/io.h"
.global myButton
myButton:
 sbi DDRB, 5 ; Set PB5 to output (connects to Arduino Uno pin 13)
 cbi DDRD, 2 ; Set PD2 to input (connects to Arduino Uno pin 2)

 
; Due to pull-down resistor, when button NOT pressed receives LOW

wait_for_button_press:
sbis PIND, 2 ; Skips next instruction if PD2 HIGH (button is pressed)
rjmp wait_for_button_press ;
call my_delay ; 
sbis PIND, 2 ; Skips next instruction if PD2 HIGH (button remains pressed)
rjmp wait_for_button_press ;

; Τοποθετήστε δεύτερο βρόχο που να αξιοποιεί την εντολή sbic για έλεγχο αν
; το πλήκτρο απελευθερώθηκε
; Η εντολή sbic συντάσσεται όπως η sbis αλλά παρακάμπτει την επόμενη εντολή αν το ελεγχόμενο
; bit είναι clear.


wait_for_button_press:
sbis PIND, 2 ; Skips next instruction if PD2 HIGH (button is pressed)
rjmp wait_for_button_press ;
call my_delay ; 
sbis PIND, 2 ; Skips next instruction if PD2 HIGH (button remains pressed)
rjmp wait_for_button_press ;


sbi PINB,5 ; Αντιστροφή του PB5.
rjmp wait_for_button_press ;
ret



my_delay: ; wait for a number of cycles
 ldi r31, hi8(1000)
 ldi r30, lo8(1000)
inner:
 sbiw r30, 1
 brne inner
 sbiw r28, 1
 brne my_delay
 ret
