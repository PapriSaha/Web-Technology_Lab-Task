
.MODEL SMALL
.STACK 100H
.DATA
    INPUT_MSG DB 'TYPE STRING: $'
    OUTPUT_MSG_1 DB 0AH,0DH
    P DB ?
.CODE
MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
 
    MOV AH,9
    LEA DX,INPUT_MSG
    INT 21H
     
     INPUT:
    MOV AH,1
    INT 21H
     CMP AL,13
     JE OUTPUT
     AND AL,0FH
     SHL BX,1
     OR BL,AL
     JMP INPUT
     
     OUTPUT:
     MOV AH,9
    LEA DX,OUTPUT_MSG_1
    INT 21H
    CALL REVERSE
 
 mov P,BL
LEA DL,BL
 

MOV AH, 09H
INT 21H
    
    END_:
    
 
    MOV AH,4CH
    INT 21H
     
    MAIN ENDP
REVERSE PROC
    
    
    MOV SI, OFFSET P
 
    
    MOV CX, 0H
 
    LOOP1:
   
    MOV AX, [SI]
    CMP AL, '$'
    JE LABEL1
 
   
    PUSH [SI]
 
   
    INC SI
    INC CX
 
    JMP LOOP1
 
    LABEL1:
    
    MOV SI, OFFSET P
 
        LOOP2:
        
        CMP CX,0
        JE EXIT
 
        
        POP DX
 
        
        XOR DH, DH
 
       
        MOV [SI], DX
 
       
        INC SI
        DEC CX
 
        JMP LOOP2
 
                 
    EXIT:
    
    MOV [SI],'$ '
    RET
         
REVERSE ENDP
END MAIN





