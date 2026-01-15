assume cs:code

code segment
     start: mov ax, 3
            mov bx,4
            add ax,bx
            mov ax,4c00h
            int 21h
code ends
end