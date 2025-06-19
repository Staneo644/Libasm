global ft_strdup
section .text

ft_strdup:
    push rbx
    extern malloc
    extern ft_strlen

    xor rcx, rcx
    call ft_strlen
    mov     rbx, rdi
    mov     rdi, rax
    call malloc wrt ..plt
    cmp     rax, 0
    je      .done
    mov     rcx, rax
    xor rax, rax


.loop:
    mov     dl, byte [rbx + rax]
    mov     byte [rcx + rax], dl
    cmp     dl, 0
    je .done
    inc rax
    jmp .loop

.done:
    mov rax, rcx
    pop rbx
    ret

section .note.GNU-stack noexec nowrite progbits