.MODEL SMALL
.STACK
.DATA
        M1 DB 'SEARCH FAILS$'
        M2 DB 'SEARCH IS SUCCESFUL$'
        NO DW 8
        A DW 1, 2, 3, 4, 5, 6, 7, 8
        KEY DW 8

.CODE
        MOV AX, @DATA
        MOV DS, AX
        MOV SI, 0
        MOV DI, NO
        ADD DI, DI
        SUB DI, 2
BACK:
        CMP SI, DI
        JA LOC3
        MOV BX, SI
        ADD BX, DI
        SHR BX, 1
        AND BX, 0FFFEH
        MOV AX, A[BX]
        CMP AX, KEY
        JE LOC1
        JB LOC2
        MOV DI, BX
        SUB DI, 2
        JMP BACK
LOC2:
        MOV SI, BX
        ADD SI, 2
        JMP BACK
LOC3:
        LEA DX, M1
        JMP AHED
LOC1:
        LEA DX, M2
AHED:
        MOV AH, 9
        INT 21H
        MOV AH, 4CH
        INT 21H
        END


