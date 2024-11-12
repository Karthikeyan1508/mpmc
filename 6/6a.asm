;data-transfer

AREA PROG1, CODE, READONLY
    ENTRY
START
    LDR R2,=0X05
    LDR R0,=SOURCE
    LDR R1,=DEST
UP LDR R3,[R0],#4
    STR R3, [R1],#4
    SUBS R2,#1
    BNE UP
STOP B STOP
    AREA SOURCE, DATA, READONLY
    DCD 0X10,0X20,0X30,0X40,0X50
    AREA DEST, DATA, READWRITE
    END
