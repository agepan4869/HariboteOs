global api_fseek

SECTION .text

api_fseek:      ; void api_fseek(int fhandle,int offset,int mode);
    push    ebx
    mov     edx,23
    mov     eax,[esp+8]     ; fhandle
    mov     ecx,[esp+16]    ; mode
    mov     ebx,[esp+12]    ; offset
    int     0x80
    pop     ebx
    ret