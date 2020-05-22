global api_fclose

SECTION .text

api_fclose:     ; void api_fclose(int fhandle);
    mov     edx,22
    mov     eax,[esp+4]     ; fhandle
    int     0x80
    ret