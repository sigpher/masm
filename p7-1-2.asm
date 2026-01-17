assume cs:code,ds:data,ss:stack
data segment
         db "unIX"
         db "foRK"
data ends

stack segment

stack ends

code segment
    start: mov ah,0
           mov bh,0
           mov al,'a'
           mov bl,'b'
           and al,11011111B
           and bl,11011111B
           mov ax,4c00h
           int 21h
code ends
end start