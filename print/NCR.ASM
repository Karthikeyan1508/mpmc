.MODEL SMALL
.DATA
    N DW 7
    R DW 5
    NCR DW 0
    MSG DB 'The value of nCr is: $'

.CODE
    MOV AX, @DATA
    MOV DS, AX
    MOV AX, N
    MOV BX, R
    CALL NCR_PROC

    ; Print the message
    LEA DX, MSG
    MOV AH, 09H
    INT 21H

    ; Convert NCR to string and print
    MOV AX, NCR
    CALL PRINT_NUM

    ; Exit program
    MOV AH, 4CH
    INT 21H

ncr_proc proc
    CMP AX, BX
    JZ N1
    CMP BX, 0
    JZ N1
    CMP BX, 1
    JZ N2
    MOV CX, AX
    DEC CX
    CMP CX,BX
    JZ N2
    PUSH AX
    PUSH BX
    DEC AX
    CALL ncr_proc
    POP BX
    POP AX
    DEC AX
    DEC BX
    CALL ncr_proc
    JMP LAST
N1: ADD NCR, 1
    RET
N2: ADD NCR, AX
LAST: RET
ncr_proc ENDP

PRINT_NUM PROC
    ; Convert number in AX to string and print it
    XOR CX, CX   ; Clear CX to use as a counter
    MOV BX, 10   ; Divisor

    PRINT_LOOP:
        XOR DX, DX   ; Clear DX before DIV
        DIV BX       ; Divide AX by BX, quotient in AX, remainder in DX
        ADD DL, '0'  ; Convert remainder to ASCII
        PUSH DX      ; Push remainder (character) onto stack
        INC CX       ; Increment counter
        TEST AX, AX  ; Check if AX is 0
        JNZ PRINT_LOOP

    PRINT_CHAR_LOOP:
        POP DX       ; Pop character from stack
        MOV AH, 02H  ; DOS interrupt to print character
        INT 21H
        LOOP PRINT_CHAR_LOOP

    RET
PRINT_NUM ENDP

END
