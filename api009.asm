GLOBAL api_malloc

SECTION .text

api_malloc:         ; char *api_malloc(int size);
    PUSH    EBX
    MOV     EDX,9
    MOV     EBX,[CS:0x0020]
    MOV     ECX,[ESP+8]         ; size
    INT     0x80
    POP     EBX
    RET
