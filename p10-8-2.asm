assume cs:code,ds:data,ss:stack
data segment
         db 16 dup(0)
data ends
stack segment

stack ends
code segment
    start: mov ax,data
           mov ds,ax
           mov ax,100
           mov bx,10000
           mul bx
           mov ds:[0],ax
           mov ds:[2],dx

           mov ax,4c00h
           int 21h
code ends
end start