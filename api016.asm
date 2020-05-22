GLOBAL api_alloctimer

SECTION .text

api_alloctimer:     ; int api_alloctimer(void);
    MOV     EDX,16
    INT     0x80
    RET
