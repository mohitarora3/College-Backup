;32 BIT DIVISION 
;DEEPTI SHARMA
;BSC(HONS)COMPUTER SCIENCE 3 YR: 2014315

.model SMALL
.386
.stack 100h
.data
a1 dd 00000000H 
a2 dd 00000000H 
s  db "Enter a number $"
RESULT dd 00000000H ,5
s2 db "Result $"
.code
start:
MOV AX,@data
MOV DS,AX

MOV DX , offset s
mov ah,09h
int 21h

CALL INP
MOV DX,BP

CALL INP
MOV AX,BP

CALL INP
MOV BX,BP

DIV BX

MOV BX, DX

;MOV DX, OFFSET S2
;MOV AH,09H
;INT 21H
MOV BP, AX
CALL OTP
MOV BP,BX
CALL OTP
 

MOV AH,4CH
INT 21H

INP PROC NEAR
MOV BP,0H
MOV CH,04H
MOV CL,04H
L2:MOV AH,01H
INT 21H
SUB AL,30H
CMP AL,0AH
JC L1
SUB AL,07H
L1:XOR AH,AH
SHL BP,CL
ADD BP,AX
DEC CH
JNZ L2
RET
INP ENDP


OTP PROC NEAR
MOV CH,04H
MOV CL,0CH
L4: MOV DX,BP
SHR DX,CL
AND DX,0FH
ADD DL,30H
CMP DL,3AH
JC L3
ADD DL,07H
L3: MOV AH,02H
INT 21H
SUB CL,04H
DEC CH
JNZ L4
RET
OTP ENDP


END

