assume cs:codesg

data segment
            db '1975', '1976', '1977', '1978', '1979', '1980', '1981', '1982', '1983'
            db '1984', '1985', '1986', '1987', '1988', '1989', '1990', '1991', '1992'
            db '1993', '1994', '1995'
            dd 16, 22, 382, 1356, 2390, 8000, 16000, 24486, 50065, 97479, 140417, 197514
            dd 345980, 590827, 803530, 1183000, 1843000, 2759000, 3753000, 4649000, 5937000
            dw 3, 7, 9, 13, 28, 38, 130, 220, 476, 778, 1001, 1442, 2258, 2793, 4037, 5635, 8226
            dw 11542, 14430, 15257, 17800
data ends

table segment
             db 21 dup ('year summ ne ?? ')
table ends

codesg segment
       start: mov  ax,data
              mov  ds,ax
              mov  bx,0
              mov  si,0
              mov  di,0

              mov  ax,table
              mov  es,ax
              mov  bp,0

              mov  cx,21
       s:
              ; 年份操作
              mov  ax,[bx+0H+si]
              mov  es:[bp+0H],ax
              mov  ax,[bx+2H+si]
              mov  es:[bp+2H],ax

              ; 公司年度总收入的操作
              mov  ax,[bx+54H+si]
              mov  es:[bp+5H],ax
              mov  ax,[bx+56H+si]
              mov  es:[bp+7H],ax

              ; 雇员人数的操作
              mov  ax,[bx+0a8h+di]
              mov  es:[bp+0ah],ax


              ; 每年人均收入
              mov  ax,[bx+54H+si]
              mov  dx,[bx+56H+si]
              div  word  ptr es:[bp+0aH+di]
              mov  es:[bp+0dh],ax
              add  bp,10h                         ; add bp, 10
              add  si,4
              add  di,2
              loop s

              mov  ax,4c00h
              int  21h
codesg ends
end start