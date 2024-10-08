        AREA    PRG6, CODE, READONLY    ; Defining logical area named PRG6 and making it read-only
        ENTRY                           ; The entry point where the code starts

        LDR     R10, =5                 ; Load immediate value 5 into R10
        MOV     R0, R10                 ; Move R10 to R0 (data transfer)
        LDR     R1, =3                  ; Load immediate value 3 into R1
        
        ADD     R2, R0, R1              ; ADD R2 = 8 (5 + 3)
        SUB     R3, R0, R1              ; SUB R3 = 2 (5 - 3)
        MUL     R4, R0, R1              ; MUL R4 = 15 (5 * 3 = 15)
        
        AND     R5, R0, R1              ; AND R5 = 1 (5 & 3)
        ORR     R6, R0, R1              ; OR R6 = 7 (5 | 3)
        EOR     R7, R0, R1              ; XOR R7 = 6 (5 ^ 3)
        
        MOV     R7, #1                  ; Exit code
        SWI     0x11                    ; Make a system call to exit

        END                             ; End of program
