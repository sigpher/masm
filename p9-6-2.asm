assume cs:code,ds:data,ss:stack
data segment

data ends

stack segment

stack ends

code segment
    start: mov ax,0020h
           mov ds,ax
           mov ax,0123H
           mov bx,0010h
           mov [bx],ax
           jmp word ptr [bx]

           mov ax,4c00h
           int 21h
code ends
end start