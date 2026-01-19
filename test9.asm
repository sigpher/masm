assume cs:code,ds:data,ss:stack
data segment
            db "Wolcome to masm!"
data ends

stack segment

stack ends

code segment
       start: mov  ax,data
              mov  ds,ax
              mov  bx,7C0H                     ;12*160+64=1984=7C0H


              mov  ax,0B800H
              mov  es,ax
              mov  si,0
              mov  di,0
              mov  bp,0

              mov  cx,16
       s:     mov  al,ds:[si]
              mov  ah,00000010B
              mov  es:[bx+di],ax

              mov  al,ds:[si]
              mov  ah,00100100B
              mov  es:[bx+di+160],ax

              mov  al,ds:[si]
              mov  ah,01110001B
              mov  es:[bx+di+160+160],ax

              add  si,1
              add  di,2
              loop s

              mov  ax,4c00H
              int  21h
code ends
end start