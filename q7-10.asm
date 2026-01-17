assume cs:code,ds:data,ss:stack
data segment
         db '1. file         '
         db '2. edit         '
         db '3. search       '
         db '4. view         '
         db '5. options      '
         db '6. help         '
data ends

stack segment

stack ends

code segment
    start: mov  ax,data
           mov  ds,ax
           mov  bx,0

           mov  cx,6
    s:     mov  al,[bx+3]
           and  al,11011111B
           mov  [bx+3],al
           add  bx,10h
           loop s

           mov  ax,4c00h
           int  21h
code ends
end start