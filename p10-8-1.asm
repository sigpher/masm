assume cs:code,ds:data,ss:stack
data segment

data ends
stack segment

stack ends
code segment
    start: mov al,2
           mov ah,3
           mul ah
           mov bx,ax

           mul bx
           mov ax,0020
           mov ds,ax
           mov byte ptr ds:[0],9
           mov ax,bx
           mul byte ptr ds:[0]


           mov ax,4c00h
           int 21h
code ends
end start