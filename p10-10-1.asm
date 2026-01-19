assume cs:code,ds:data,ss:stack
data segment

data ends
stack segment

stack ends
code segment
    start: mov  bx,3
           call cube
           mov  dx,ax

           mov  ax,4c00h
           int  21h

    ;说 明 : 计算 N 的 3 次 方
    ;参 数 : (bx)=N
    ;结 果 :
    ;(dx:ax)=N*3
    cube:  mov  ax,bx
           mul  bx
           mul  bx
           ret
code ends
end start