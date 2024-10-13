%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    push ebp
    mov ebp, esp
    pusha

    mov ecx, [ebp + 8]  ; len
    mov esi, [ebp + 12] ; plain
    mov edi, [ebp + 16] ; enc_string
    mov edx, [ebp + 20] ; step

    xor eax, eax         ; set eax to 0

.loop:
    cmp eax, ecx         ; check if we've processed the whole string
    je .done             ; if yes, jump to done
    movzx ebx, byte [esi + eax]  ; load the byte at the current position
    add bl, dl           ; add the shift amount to the byte
    cmp bl, 'Z'          ; check if we've gone past 'Z'
    jle .shifted         ; if not, jump to shifted
    sub bl, 26           ; if yes, subtract 26 to wrap around
.shifted:
    mov byte [edi + eax], bl     ; store the shifted byte in the output string
    inc eax              ; increment the position counter
    jmp .loop            ; jump back to loop

.done:
    popa
    leave
    ret



