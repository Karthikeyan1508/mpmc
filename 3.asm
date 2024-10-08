.MODEL SMALL

.DATA
    STR DB "MADAM$"
    LEN EQU $-1-STR
    RSTR DB 10 DUP('$')
    MSG DB " REVERSE STRING IS: $"
    MSG1 DB " STRING IS A PALINDROME $"
    MSG2 DB " STRING IS NOT A PALINDROME $"

.CODE
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX
    LEA SI, STR
    LEA DI, RSTR
    ADD DI, LEN-1
    MOV CX, LEN

RPT:
    MOV AL, [SI]
    MOV [DI], AL
    INC SI
    DEC DI
    LOOP RPT

    LEA DX, STR
    MOV AH, 09H
    INT 21H

    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    LEA DX, RSTR
    MOV AH, 09H
    INT 21H

    LEA SI, STR
    LEA DI, RSTR
    MOV CX, LEN
    REPE CMPSB
    JNE NOTPAL

    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
    JMP EXIT

NOTPAL:
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H
END
