    AREA PROG6, CODE, READONLY

    ENTRY
START
    LDR     R10, =5      ; Load the value 5 into R10
    MOV     R0, R10      ; Move the value in R10 to R0
    LDR     R1, =-3      ; Load the value -3 into R1

    ADD     R2, R0, R1   ; R2 = R0 + R1 (Addition)
    SUB     R3, R0, R1   ; R3 = R0 - R1 (Subtraction)
    MUL     R4, R0, R1   ; R4 = R0 * R1 (Multiplication)
    AND     R5, R0, R1   ; R5 = R0 AND R1 (Bitwise AND)
    ORR     R6, R0, R1   ; R6 = R0 OR R1 (Bitwise OR)

STOP 
    B       STOP         ; Infinite loop to stop execution

    END
