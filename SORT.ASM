.MODEL SMALL
.STACK
.DATA
        A DB 77, 42, 35, 12, 255, 05
        L DW $-A

.CODE
        MOV AX, @DATA
        MOV DS, AX
        MOV BX, L
        DEC BX

NXTPASS:
        MOV CX, BX
        MOV SI, 0

NXTCOMP:
        MOV AL, A[SI]
        INC SI
        CMP AL, A[SI]
        JB NO_EXG
        XCHG AL, A[SI]
        MOV A[SI-1], AL

NO_EXG:
        LOOP NXTCOMP
        DEC BX
        JNZ NXTPASS
        MOV AH, 4CH
        INT 21H
        END

   
