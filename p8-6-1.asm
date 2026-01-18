assume cs:code,ds:data,ss:stack
data segment
         db "DEC","Ken Oslen"
         dw 137,40
         db "PDP"
data ends

stack segment

stack ends

code segment
    start: mov ax,data
           mov ds,ax
           mov bx,0ch

           mov word ptr [bx+0ch],38
           add word ptr [bx+0eh],70
           mov si,0
           mov byte ptr [bx+10h+si],'V'
           inc si
           mov byte ptr [bx+10h+si],'A'
           inc si
           mov byte ptr [bx+10h+si],'X'


           mov ax,4c00h
           int 21h
code ends
end start