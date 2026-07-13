; This file is part of AssilLoader
; Under the MIT License
; Copyright (c) 2022 Antonin Hérault, Copyright (c) 2026 AssilOS Project

; Parameters :
;   si: byte[]
print_chars:
    push ax
    push bx

    .loop:
        lodsb ; ds:si -> al
        
        ; Checks for NULL character
        cmp al, 0 
            jz .print_end
        
        mov ah, 0x0E ; service 0x0E, BIOS 0x10 int
        mov bx, 0x07
        int 0x10 ; BIOS call
        jmp .loop

    .print_end:
        pop bx
        pop ax
        ret
