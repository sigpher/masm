assume cs:code,ds:data,ss:stack
data segment

data ends
stack segment

stack ends
code segment
    start: mov  ax, 4240H
           mov  dx, 000FH
           mov  cx, 0AH
           call divdw

           mov  ax, 4c00h
           int  21h

    ;功能:进行不会产生溢出的除法运算
    ;被除数:dword 型
    ;除数:word型
    ;结果:dword型

    ; 参 数:
    ;(ax)=dword型数据的低16位
    ;(dx)=dword型数据的高16位
    ;(cx)=除数

    ;返回:
    ;(dx)=结果的高16位，(ax)为结果的低16位
    ;(cx)=余数
    ;应用举例，计算1000000/10(F4240H/0AH)
    ;公式 X/N = int(H/N)*65536 + [rem(H/N)*65536+L]/N
    divdw:
           ;先计算int(H/N) -> 现在是 dx 存放 H
           push bx
           push ax

           mov  ax, dx       ;除数位16位，因此被除数要设置为32位
           mov  dx, 0        ;将高 16 位置 0
           div  cx           ;ax 存放着int(H/N), dx 存放着rem(H/N)

           ;计算[rem(H/N)*65536+L]/N
           mov  bx, ax       ;保存int(H/N)
           pop  ax           ;将L存入ax
           div  cx           ;ax存放着结果低16位，dx存放着余数

           ;保存结果
           mov  cx, dx       ;cx 存放结果的余数

           pop  bx
           ret
code ends
end start