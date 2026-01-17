assume cs:code
code segment
         mov  ax,0
         mov  bx,236
         mov  cx,123
    s:   add  ax,bx
         loop s

         mov  ax,4c00h
         int  21h
code ends
end