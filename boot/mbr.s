;--------------------------------------------------------------
;                       简单的引导扇区
;       清除bios显示的信息，再显示一个one os loading在屏幕中央
;       使用10h号中断的功能来实现显示字符
;--------------------------------------------------------------

org     7c00H                           ;指示汇编器将程序起始地址定位7c00h, MBR会被加载到这里
jmp     Start                           ;程序开始

BootMessage     db      "Loading LOADER..."  ;定义要显示的字符串

Start:
        mov     ax, cs
        mov     ds, ax
        mov     es, ax
        call    clear                   ;清屏
        call    display                 ;显示我们的信息
        jmp     $                       ;死循环
clear:
        mov     ah, 07H                 ;设置为屏幕滚动和清屏功能
        mov     al, 00H                 ;设置功能为清屏
        mov     ch, 0                   ;设置生效区域的左上角位置（ch代表行，cl代表列）
        mov     cl, 0                   ;
        mov     dh, 24                  ;设置生效区域的右下角位置（dh代表行，dl代表列）
        mov     dl, 79                  ;
        int     10H                     ;视频显示中断
        ret
display:  
        mov     ax, BootMessage  
        mov     bp, ax                  ;es:bp表示字符串的储存位置
        mov     cx, 11H                 ;cx储存要显示的字符个数(当前17个)
        mov     dh, 12                  ;dh储存显示位置的行数（没有后缀表示十进制数）
        mov     dl, 25                  ;dl储存显示位置的列数
        mov     ah, 13H                 ;ah储存功能选项，13H（19）表示显示字符串
        mov     al, 01H                 ;al储存光标控制选项(移动光标)
        mov     bh, 00H                 ;设置显示页数 
        mov     bl, 0aH                 ;设置显示属性             
        int     10H                     ;视频显示中断         
        ret  
times   510-($-$$)      db      0       ;引导扇区只有512byte，我们把不足的用0填满
dw      0aa55H                          ;引导扇区必须以aa55h结束，nasm规定以字符开头的16进制数前需加0







	
