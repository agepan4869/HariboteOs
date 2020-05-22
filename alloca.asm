GLOBAL alloca

SECTION .text

alloca:
    add     eax,-4
    sub     esp,eax
    jmp     dword[esp+eax]      ; retの代わり