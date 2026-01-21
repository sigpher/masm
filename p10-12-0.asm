assume cs:code,ds:data,ss:stack
data segment
         db 'word', 0
         db 'unix', 0
         db 'wind', 0
         db 'good', 0
data ends
stack segment

stack ends
code segment
    start:   mov  ax, data
             mov  ds, ax
             mov  bx, 0

             mov  cx, 4
    s:       mov  si, bx
             call capital
             add  bx, 5
             loop s

             mov  ax, 4c00h
             int  21h

    capital: push si
             push cx
    change:  mov  ch, 0
             mov  cl, ds:[si]
             jcxz ok
             add  byte ptr [si], 11011111B
             inc  si
             jmp  change

    ok:      pop  cx
             pop  si
             ret
code ends
end start