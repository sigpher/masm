assume cs:code,ds:data,ss:stack
data segment

data ends

stack segment

stack ends

code segment
    start: mov ax,0123H
           mov ds:[0],ax
           mov word ptr ds:[2],0
           jmp dword ptr ds:[0]

           mov ax,4c00h
           int 21h
code ends
end start