assume cs:code,ds:data,ss:stack
data segment
            db 16 dup(0)
data ends
stack segment
             db 16 dup(0)
stack ends
code segment
       start: mov  ax, 12666
              mov  bx, data
              mov  ds, bx
              mov  si, 0

              mov  bx, stack
              mov  ss, bx
              mov  sp, 16

              call dtoc




              ; 先将0压栈
              mov  bx, 0
              push bx

       dtoc:  mov  dx, 0
              mov  bx, 10
              div  bx              ;ax为商，dx为余数
              push dx              ;ax为商，dx为余数
              ret

       ;   mov  dh, 8
       ;   mov  dl, 3
       ;   mov  cx, 2
       ;   call show_str

              mov  ax, 4c00H
              int  21H

       ; show_str: push ax
       ;           push bx
       ;           push cx
       ;           push si

       ;           mov  bx, 0
       ;           mov  ax, 0B800H
       ;           mov  es, ax
       ;           mov  al, 0a0H
       ;           mul  dh
       ;           add  bx, ax
       ;           mov  al, 2
       ;           inc  dl
       ;           mul  dl
       ;           add  bx, ax
       ;           mov  al, cl


       ; s:        mov  ch, 0
       ;           mov  cl, [si]
       ;           jcxz ok
       ;           mov  ch, al
       ;           mov  word ptr es:[bx], cx
       ;           add  si, 1
       ;           add  bx, 2
       ;           jmp  s

       ; ok:       pop  si
       ;           pop  cx
       ;           pop  bx
       ;           pop  ax
       ;           ret

code ends
end start