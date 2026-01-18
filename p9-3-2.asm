assume cs:code,ds:data,ss:stack
data segment

data ends

stack segment

stack ends

code segment
    start: mov ax,1
           mov bx,2
           jmp s
           db  0FFh dup(0)
    s:     add ax,1
           inc ax

           mov ax,4c00h
           int 21h
code ends
end start