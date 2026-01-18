assume cs:code,ds:data,ss:stack
data segment

data ends

stack segment

stack ends

code segment
    start: mov ax,0123H
           mov [bx],ax
           mov word ptr [bx+2],0

           jmp dword ptr [bx]

           mov ax,4c00h
           int 21h
code ends
end start