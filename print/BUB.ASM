.MODEL SMALL
.STACK 100H
.DATA
    ; Array of integers to be sorted
    arr DB 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
    arrLen EQU $ - arr  ; Length of the array

    ; Messages
    msg1 DB 'Sorted Array: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Initialize counters
    MOV CX, arrLen-1  ; CX = number of elements - 1
    MOV SI, 0         ; SI = array index
    
SortLoop:
    MOV DI, 0         ; DI = start index for each pass
    MOV BX, CX        ; BX = loop counter for inner loop

InnerLoop:
    MOV AL, arr[DI]   ; Load arr[DI] into AL
    MOV DL, arr[DI+1] ; Load arr[DI+1] into DL
    CMP AL, DL        ; Compare AL and DL
    JBE NoSwap        ; If arr[DI] <= arr[DI+1], no swap

    ; Swap arr[DI] and arr[DI+1]
    XCHG AL, arr[DI+1]
    MOV arr[DI], AL

NoSwap:
    INC DI            ; Move to the next element
    DEC BX            ; Decrement loop counter
    JNZ InnerLoop     ; Repeat inner loop until BX=0

    DEC CX            ; Decrease the pass count
    JNZ SortLoop      ; Repeat outer loop until sorted

    ; Print the sorted array
    LEA DX, msg1
    MOV AH, 09H
    INT 21H           ; Print message

    MOV CX, arrLen    ; CX = length of array
    MOV SI, 0         ; SI = array index

PrintLoop:
    MOV AL, arr[SI]   ; Load element into AL
    ADD AL, 30H       ; Convert number to ASCII
    MOV DL, AL
    MOV AH, 02H
    INT 21H           ; Print the number

    MOV DL, ' '
    MOV AH, 02H
    INT 21H           ; Print space

    INC SI            ; Move to next element
    LOOP PrintLoop    ; Repeat until all elements are printed

    ; End program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
