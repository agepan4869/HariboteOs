mov     eax,1*8     ; os用のセグメント番号
mov     ds,ax       ; これをdsにしちゃう
mov     byte[0x102600],0
mov     edx,4
int     0x40