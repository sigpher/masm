assume cs:code,ds:data,ss:stack
data segment
         db "BaSic"
         db "MinIX"
data ends

stack segment

stack ends

code segment
    start: mov  ax,data
           mov  ds,ax

           mov  bx,0

           mov  cx,5
    s:     mov  al,[bx]
           and  al,11011111B
           mov  [bx],al
           mov  al,5[bx]
           or   al,00100000B
           mov  5[bx],al
           inc  bx
           loop s

           mov  ax,4c00h
           int  21h
code ends
end start