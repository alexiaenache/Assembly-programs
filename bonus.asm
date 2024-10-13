section .text
    global bonus

bonus:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]    ; x
    mov ebx, [ebp + 12]    ; y
    mov ecx, [ebp + 16] ; board

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE

    mov dl, 0b00000101 ; initialize the line

    push ecx
    mov ecx, ebx
    ;if the collom is 0 the line has to be 
    ;shifted to the right one position
    ;if the collom is from 1 to 7 the line 
    ;has to be shifted to the left collom - 1
    test ecx, ecx 
    jnz sl
    shr dl, 1

    jmp xstop

sl:
    dec ecx
    shl dl, cl

xstop:
    pop ecx
    ;after the line has been shifted 
    ;here is decided where to put it in the matrix
    mov esi, eax
    inc esi
    ;if the position is on the line 7 the 
    ;above line is not needed
    cmp esi, 8 
    jge line_below
    ;if the position is on the line 3-7 -> subtract 4
    cmp esi, 4
    jge line_above_sub
    ;if the position is on the line 0-2 -> add 4
    add esi, 4
    jmp line_above_put

line_above_sub:
    sub esi, 4

line_above_put:
    ;put the line in the matrix
    or byte [ecx + esi], dl

line_below:
    mov edi, eax
    dec edi
    ;if the position is on line 0 
    ;the bottom_line is not needed
    cmp edi, -1 
    jle program_end
    ;if the position is on the lines 5-7 -> subtract 4
    cmp edi, 4
    jge line_below_sub
    ;if the position is on the lines 0-4 -> add 4
    add edi, 4
    jmp line_below_put

line_below_sub:
    sub edi, 4

line_below_put:
    ;put the line in the matrix
    or byte [ecx + edi], dl

program_end:
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY


