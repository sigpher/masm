assume cs:code
code segment
    start: mov ax,bx
           sub ax,ax
           jmp ax
           mov ax,4c00h
           int 21h
code ends
end start