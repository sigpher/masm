assume cs:code,ds:data,ss:stack
data segment

data ends

stack segment

stack ends

code segment
    start: mov ax,2000h
           mov ds,ax
           mov bx,1000h
           mov word ptr [bx],00BEh
           add bx,2
           mov word ptr  [bx],0006h
           add bx,2
           mov word ptr  [bx],0000h

           mov ax,4c00h
           int 21h
code ends
end start