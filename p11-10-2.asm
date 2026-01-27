assume cs:code,ds:data,ss:stack
data segment
         db 16 dup(0)
data ends
stack segment

stack ends
code segment
    start: mov   ax, 0F000H
           mov   ds, ax
           mov   si, 0FFFFH

           mov   ax, data
           mov   es, ax
           mov   di, 15

           mov   cx, 10H
           std
           movsb

           mov   ax, 4c00h
           int   21h
code ends
end start