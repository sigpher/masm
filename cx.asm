assume cs:code,ds:data,ss:stack
data segment

data ends

stack segment

stack ends

code segment
    start: mov  ax,0ffffH
           mov  ds,ax
           mov  bx,0
           mov  cx,0
    s:     mov  cl,ds:[bx]
           jcxz ok
           inc  bx
           jmp  s
    ok:    mov  dx,bx

           mov  ax,4c00h
           int  21h
code ends
end start