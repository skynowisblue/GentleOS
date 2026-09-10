[org 0x7C00]
[bits 16]

start:
    mov si, OSMSG
    call PrintString
    mov si,bootMSG
    call PrintString

    jmp $

PrintString:
    lodsb
    or al,al
    jz .done
    mov ah,0x0E
    int 0x10
    jmp PrintString

.done:
    ret


bootMSG: db "BootLoader Initialized...", 0
OSMSG: db "GentleOS version 0.01..", 0
times 510-($-$$) db 0
dw 0xAA55