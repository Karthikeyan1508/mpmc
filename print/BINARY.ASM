.MODEL SMALL

.DATA
ARR DW 1,2,3,4,5,6,7
LEN DW ($-ARR)/2
MSG1 DB "KEY IS FOUND$"
MSG2 DB "KEY IS NOT FOUND$"
X DW 6

.CODE
MOV AX,@DATA
MOV DS, AX
MOV SI,0000H ; SI is LOW
MOV DI,LEN
ADD DI,DI
SUB DI,2 ; DI is HiGH

RPT: 
CMP SI,DI ; Comparing SI with DI
JA KNF ; IF SI > DI jump to KNF
MOV AX,X ; AX= key
MOV BX,SI ;BX (MID) = (SI + DI )/2
ADD BX,DI
SHR BX,1
CMP AX,ARR[BX] ; Comparing AX (KEY) With middle element ARR[BX]
JE KF ; if key = middle element jump to KF
JB NEXT ; if KEY < middle element jump to NEXT
MOV SI,BX ; if KEY > middle element low (SI) = mid (bx)+2
ADD SI,2
JMP RPT

NEXT:
MOV DI,BX ; if key < mid element high (di)= mid (bx)-2
SUB DI,2
JMP RPT

KF: 
LEA DX,MSG1 ; display the message "KEY is found"
MOV AH,09H
INT 21H
JMP EXIT ; jump to exit

KNF:
LEA DX,MSG2; display the message "key is not found"
MOV AH,09H
INT 21H

EXIT: 
MOV AH,4CH
INT 21H

END