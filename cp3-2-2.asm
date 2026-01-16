assume cs:code

code segment
    start: mov ax,2000h
           mov ds,ax
           mov ax,1000h
           mov ss,ax
           mov sp,0h

           pop ds:[0eh]
           pop ds:[0ch]
           pop ds:[0ah]
           pop ds:[8h]
           pop ds:[6h]
           pop ds:[4h]
           pop ds:[2h]
           pop ds:[0h]

           mov ax,4c00h
           int 21h
code ends
end start