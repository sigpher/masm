assume cs:code,ds:data,ss:stack
data segment
            db "welcome to masm!"
            db 10h dup('.')
data ends

stack segment

stack ends

code segment
       start: mov  ax,data
              mov  ds,ax
              mov  si,0
              mov  cx,10h

       s:     mov  al,[si]
              mov  10h[si],al
              inc  si
              loop s

              mov  ax,4c00h
              int  21h
code ends
end start