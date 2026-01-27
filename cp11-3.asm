assume cs:code,ds:data
data segment
            db 8, 11, 15, 7, 19, 0
data ends

code segment
       start: mov  ax, data
              mov  ds, ax

              mov  bx, 0
              mov  ax, 0
              mov  ch, 0

       s:     mov  cl, [bx]
              jcxz z0
              cmp  byte ptr [bx], 10
              jb   next
              cmp  byte ptr [bx], 20
              ja   next
              inc  ax

       next:  inc  bx
              jmp  s
       z0:    mov  ax, 4c00h
              int  21h
code ends
end start