    mov     al,0x34
    out     0x43,al
    mov     al,0xff
    out     0x40,al
    mov     al,0xff
    out     0x40,al

; ↑これは以下のプログラムに相当
; io_out8(PIT_CTRL,0x34);
; io_out8(PIT_CNT0,0xff);
; io_out8(PIT_CNT0,0xff);

    mov     edx,4
    int     0x40