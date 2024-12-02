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

DESABLE:
    MOV AL,80H
    OUT 03,AL

INPUT:
    IN AL,01
    AND AL,83H
    CMP AL,83H
    JNZ DISABLE
    MOV AL,2
    OUT 03,AL
    JMP INPUT
    END INIT