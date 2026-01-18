assume cs:code,ds:data,ss:stack
data segment

data ends

stack segment

stack ends

code segment
    start: mov ax,0
           jmp short s
           add ax,1
           add ax,1
    s:
           mov ax,4c00h
           int 21h
code ends
end start