global api_putstr1

SECTION .text

api_putstr1:        ; void api_putstr1(char *s,int l);
    push    ebx
    mov     edx,3
    mov     ebx,[esp+8]     ; s
    mov     ecx,[esp+12]    ; l
    int     0x80
    pop     ebx
    ret