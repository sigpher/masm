assume cs:code,ds:data,ss:stack
data segment

data ends
stack segment

stack ends
code segment
    start: sub  al, al
           mov  al, 1
           push ax
           pop  bx
           add  al, bl
           add  al, 10
           mul  al

           mov  ax, 4c00h
           int  21h
code ends
end start