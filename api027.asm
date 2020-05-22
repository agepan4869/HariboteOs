global api_getlang

SECTION .text

api_getlang:        ; int api_getlang(void);
    mov     edx,27
    int     0x80
    ret
