assume cs:code,ds:data,ss:stack
data segment

data ends

stack segment
             db 16 dup(0)
stack ends

code segment
              mov  ax, 4c00H
              int  21h
       start: mov  ax,stack
              mov  ss,ax
              mov  sp,10h
              mov  ax,0
              push cs
              push ax
              mov  bx,0
              retf
code ends
end start