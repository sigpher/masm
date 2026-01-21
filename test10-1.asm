assume cs:code 
data segment
         db 'Welcome to masm!', 0
data ends
 
stack segment
          dw 8 dup(0)    ;用于在调用子程序时存放寄存器值
stack ends

code segment
    start:    mov  dh, 8             ;行
              mov  dl, 3             ;列
              mov  cl, 2             ;颜色

              mov  ax, data
              mov  ds, ax
              mov  si, 0

              mov  ax, stack         ;设置栈顶
              mov  ss, ax
              mov  sp, 10H

              call show_str

              mov  ax, 4c00h
              int  21h

    show_str: push ax
              push dx
              push si
              push cx

              mov  si, 0

              ;计算显存中行的偏移量
              mov  al, 0A0H
              mul  dh               ;由于显示原因 dh 不减1
              mov  bx, ax           ;bx存放内存行

              ;计算显存中列的偏移量
              mov  ax, 02H
              dec  dl               ;dl 按照分析的思路减1
              mul  dl
              add  bx, ax           ;存放内存行+列 = 存放地址

              mov  ax, 0B800H
              mov  es, ax           ;设置显存段地址
              mov  al, cl           ;下面要修改cl 先用 al 来保存颜色

    setting:  mov  cl, ds:[si]
              mov  ch, 0
              jcxz ok
              mov  es:[bx], cl      ;送入字符
              mov  es:[bx+1], al    ;设置字符颜色
              inc  si               ;下一个字符位置
              add  bx, 2            ;下一个写入位置
              jmp  setting

    ok:       pop  cx
              pop  si
              pop  dx
              pop  ax
              ret                   ;返回
code ends
end start