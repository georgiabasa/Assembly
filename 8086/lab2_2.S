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

TABST1:
    CLD
    MOV SI, OFFSET TABLE1
    MOV BL,5
    JMP LOOP1

TABST2:
    CLD
    MOV SI, OFFSET TABLE2
    MOB BL,2

LOOP1:
    LODSB
    OUT 03,AL
    LODSB
    MOV DL,AL
    CALL DELAY
    DEC BL
    JNZ LOOP1
    IN AL,01
    AND AL,01H
    CMP AL,01H
    JNZ TABST2
    JMP TABST1
    OUT 03,AL

DELAY:
    MOV CX,27000
DEL1:
    DEC CX
    JNZ DEL1
    DEC DL
    JNZ DELAY
    RET

TABLE1:
    DB 28H,200
    DB 28H,150
    DB 48H,40
    DB 82H,120
    DB 84H,40

TABLE2:
    DB 0H,20
    DB 00H,20

    END INIT