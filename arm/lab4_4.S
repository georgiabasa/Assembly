; division/multiplication

__main PROC
    EXPORT __main
    IMPORT __heap_base

Main
    mov r0, #10
    mov r1, #5
    mor r2, #2

    BL multi_div_func

multi_div_func
    umull r3, r4, r0, r1
    cmp r2, #0
    beq DivisionByZeroError
    sdiv r4, r4, r2
    BX lr 

DivisionByZeroError
    mov r4, #-1

    BX lr
    ENDP
    END