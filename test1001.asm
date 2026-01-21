assume cs:code,ds:data,ss:stack
data segment
         db 'Welcome to masm!', 0
data ends
stack segment
          dw 8 dup(0)
stack ends
code segment
    start:    mov  dh, 8
              mov  dl, 3
              mov  cl, 4
              mov  ax, data
              mov  ds, ax
              mov  si, 0
              call show_str

              mov  ax, 4c00h
              int  21h

    show_str: push ax
              push bx
              push cx
              push si

              mov  bx, 0
              mov  ax, 0B800H
              mov  es, ax
              mov  al, 0a0h
              mul  dh
              add  bx, ax
              mov  al, 2
              inc  dl
              mul  dl
              add  bx, ax
              mov  al, cl


    s:        mov  ch, 0
              mov  cl, [si]
              jcxz ok
              mov  ch, al
              mov  word ptr es:[bx], cx
              add  si, 1
              add  bx, 2
              jmp  s

    ok:       pop  si
              pop  cx
              pop  bx
              pop  ax
              ret
code ends
end start
