assume cs:code,ds:data,ss:stack
data segment
         db 'conversation', 0
data ends
stack segment

stack ends
code segment
    start:    mov  ax, data
              mov  ds, ax
              mov  si, 0

              call captital

              mov  ax, 4c00h
              int  21h

    captital: mov  cl, [si]
              mov  ch, 0
              jcxz ok
              and  byte ptr [si], 11011111B
              inc  si
              jmp  captital
    ok:       ret
code ends
end start