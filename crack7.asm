    global HariMain

section .text

HariMain:
    mov     ax,4
    mov     ds,ax
    cmp     dword[ds:0x0004],'Hari'
    jne     fin     ; アプリではないようなので何もしない
    
    mov     ecx,[ds:0x0000]     ; このアプリのデータセグメントの大きさを読み取る
    mov     ax,12
    mov     ds,ax

crackloop:      ; 123で埋め尽くす
    add     ecx,-1
    mov     byte[ds:ecx],123
    cmp     ecx,0
    jne     crackloop

fin:            ; 終了
    mov     edx,4
    int     0x80