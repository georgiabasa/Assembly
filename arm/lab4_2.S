; addressing modes

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
    ldr r1, = __heap_base
    add r1, r1, #4
    mov r2, #0xFF
    strb r2, [r1]

    ldr r1, =__heap_base
    add r2, r1, #20
    ldmia r1!, (r4-r5)
    stmia r2, (r4-r5)
    add r2, r2, #8
    ldrh r4, [r1]
    strh r4, [r2]