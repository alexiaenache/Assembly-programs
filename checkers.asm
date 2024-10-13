section .data

section .text
global checkers
extern printf

checkers:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]   ; x
    mov ebx, [ebp + 12]  ; y
    mov ecx, [ebp + 16]  ; table

    ;; DO NOT MODIFY
    ;; FREESTYLE STARTS HERE
    ;PRINTF32 `%d\n\x0`, eax
    ;xor ecx , ecx

 ;check if the position is valid

    cmp eax, 0
    jl end
    cmp eax, 7
    jg end
    cmp ebx, 0
    jl end
    cmp ebx, 7
    jg end

;check if the position is on the sides
    cmp eax, 0
    je left_side
    cmp ebx, 0
    je upper_side
    cmp ebx, 7
    je bottom_side
    cmp eax, 7
    je right_side
;taking care of the case when all 
;4 positions are available
    xor edx, edx
    mov edx, eax
    sub edx, 1
    imul edx, 8
    add edx, ebx
    sub edx, 1
    mov dword [ecx + edx * 1], 1

    xor edx, edx
    mov edx, eax
    sub edx, 1
    imul edx, 8
    add edx, ebx
    add edx, 1
    mov dword [ecx + edx * 1], 1

    xor edx, edx
    mov edx, eax
    add edx, 1
    imul edx, 8
    add edx, ebx
    sub edx, 1
    mov dword [ecx + edx * 1], 1

    xor edx, edx
    mov edx, eax
    add edx, 1
    imul edx, 8
    add edx, ebx
    add edx, 1
    mov dword [ecx + edx * 1], 1
    jmp end
;the case where only 2 positions are avilable
left_side:
    cmp ebx, 0
    je down_left
    cmp ebx, 7
    je up_left
    xor edx, edx
    mov edx, eax
    add edx, 1
    imul edx, 8
    add edx, ebx
    sub edx, 1
    mov dword [ecx + edx * 1], 1

    xor edx, edx
    mov edx, eax
    add edx, 1
    imul edx, 8
    add edx, ebx
    add edx, 1
    mov dword [ecx + edx * 1], 1
    jmp end

right_side:
    xor edx, edx
    mov edx, eax
    sub edx, 1
    imul edx, 8
    add edx, ebx
    sub edx, 1
    mov dword [ecx + edx * 1], 1

    xor edx, edx
    mov edx, eax
    sub edx, 1
    imul edx, 8
    add edx, ebx
    add edx, 1
    mov dword [ecx + edx * 1], 1
    jmp end

upper_side:
    cmp eax, 0
    je up_right
    xor edx, edx
    mov edx, eax
    sub edx, 1
    imul edx, 8
    add edx, ebx
    add edx, 1
    mov dword [ecx + edx * 1], 1

    xor edx, edx
    mov edx, eax
    add edx, 1
    imul edx, 8
    add edx, ebx
    add edx, 1
    mov dword [ecx + edx * 1], 1
    jmp end

bottom_side:
    cmp eax, 0
    je down_right
    xor edx, edx
    mov edx, eax
    sub edx, 1
    imul edx, 8
    add edx, ebx
    sub edx, 1
    mov dword [ecx + edx * 1], 1

    xor edx, edx
    mov edx, eax
    add edx, 1
    imul edx, 8
    add edx, ebx
    sub edx, 1
    mov dword [ecx + edx * 1], 1
    jmp end
;here is the case where only one 
;position is available
down_left:
    xor edx, edx
    mov edx, 9
    mov dword [ecx + edx * 1], 1
    jmp end

down_right:
    xor edx, edx
    mov edx, 49
    mov dword [ecx + edx * 1], 1
    jmp end
up_left:
    xor edx, edx
    mov edx, 14
    mov dword [ecx + edx * 1], 1
    jmp end


up_right:
    xor edx, edx
    mov edx, 54
    mov dword [ecx + edx * 1], 1
    jmp end
end:


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY



