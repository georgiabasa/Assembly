; min-max

main_loop
    ldr r1, =__heap_base
    movs r3, #0x09
    movs r2, #0x01

loop 
    strb r2, [r1], #1
    add r2, r2, #1
    cmp r3, #0
    beq End_loop
    sub r3, r3, #1
    b loop

    nop

    B main_loop

End_loop
    ldr r1, =__heap_base
    add r1, r1, #4
    mov r2, #0xFF
    strb r2, [r1]

Loop 
    ldrb r6, [r1], #1
    cmp r6,r4
    bgt update_max

    cmp r6, r5
    blt update_min

update_max
    mov r4, r6
    b continue_loop

update_min
    mov r5,r6

continue_loop
    cmp r3, #0
    bed End_loopsub r3, r3, #1
    b Loop