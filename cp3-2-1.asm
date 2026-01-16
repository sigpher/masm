assume cs:code

code segment
    start: mov  ax,1000h
           mov  ds,ax
           mov  ax,2000h
           mov  ss,ax
           mov  sp,0010h

           push ds:[0]
           push ds:[2]
           push ds:[4]
           push ds:[6]
           push ds:[8]
           push ds:[0ah]
           push ds:[0ch]
           push ds:[0eh]

           mov  ax,4c00h
           int  21h
code ends
end start