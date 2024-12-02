; Initial assembler source file for FLT-8086

assume cs:CODE, ds:CODE, es:CODE
org     0050h:0100h

;add your source code here

ORG 0100h

INIT:
    MOV AL, 99H
    OUT 07,AL
    MOV AL,0
    OUT 03,AL

TABST:
    CLD
    MOV SI, OFFSET TABLE
    MOV BL,5

LOOP:
    LODSB
    OUT 03,AL
    LODSB
    MOV DL,AL
    CALL DELAY
    DEC BL
    JNZ LOOP
    JMP TABST
DELAY:
    MOV CX,27000
DEL1:
    DEC CX
    JNZ DEL1
    DEC DL
    JNZ DELAY
    RET

TABLE:
    DB 28H,200
    DB 28H,150
    DB 48H,40
    DB 82H,120
    DB 84H,40

    END INIT