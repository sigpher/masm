assume cs:code,ds:data,ss:stack
data segment

data ends

stack segment
          db 16 dup (0)
stack ends

code segment
    start: mov  ax,stack
           mov  ss,ax
           mov  sp,10h
           mov  ax,1000h
           push ax
           mov  ax,0
           push ax
           retf

           mov  ax,4c00H
           int  21h
code ends
end start