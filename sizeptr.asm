assume cs:code,ds:data,ss:stack
data segment
         db 'abcdefghijklmnop'
data ends

stack segment
          db 16 dup(0)
stack ends

code segment
    start: mov  ax,data
           mov  ds,ax
           mov  ax,stack
           mov  ss,ax
           mov  sp,10h
           mov  bx,0
           push ds:[0]
           inc  word ptr [bx]

           mov  ax,4c00h
           int  21h
code ends
end start