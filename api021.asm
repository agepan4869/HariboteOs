global api_fopen

SECTION .text

api_fopen:      ; int api_fopen(char *fname);
    push    ebx
    mov     edx,21
    mov     ebx,[esp+8]     ; fname
    int     0x80
    pop     ebx
    ret