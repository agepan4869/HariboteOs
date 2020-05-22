global api_fsize

SECTION .text

api_fsize:      ; int api_fsize(int fhandle,int mode);
    mov     edx,24
    mov     eax,[esp+4]     ; fhandle
    mov     ecx,[esp+8]     ; mode
    int     0x80
    ret