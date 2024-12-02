; memory fill

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

    BX r14
    ENDP