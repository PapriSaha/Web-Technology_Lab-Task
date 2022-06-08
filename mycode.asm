.model small
.stack 100h
.data
.code
main proc       
    
    
    mov cx,255  
    
   com: 
    cmp cx,0
    jnz top:
    jmp exit:
    
    top:
    
    mov ah,2
    
    
    mov dx,cx
    
    
    
    
    int 21h
    
    dec cx
    loop com 
    
    exit:
    
    mov ah,4ch
    int 21h
    main endp

end main
