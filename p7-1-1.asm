assume cs:code,ds:data,ss:stack
data segment

data ends

stack segment

stack ends

code segment
    start: mov al,01100011B
           and al,00111011B

           mov al,01100011B
           or  al,00111011B

           mov ax,4c00h
           int 21h
code ends
end start