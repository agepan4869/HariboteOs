GLOBAL api_inittimer

SECTION .text

api_inittimer:      ; void api_inittimer(int timer,int data);
    PUSH    EBX
    MOV     EDX,17
    MOV     EBX,[ESP+8]     ; timer
    MOV     EAX,[ESP+12]    ; data
    INT     0x80
    POP     EBX
    RET
