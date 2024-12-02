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

READ:
    IN AL, 01
    NOT AL
    OUT 03,AL
    JMP READ
    END INIT