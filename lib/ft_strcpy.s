global ft_strcpy
section .text

ft_strcpy:
    xor rax, rax

.loop:
    mov     dl, byte [rsi + rax]
    mov     byte [rdi + rax], dl
    cmp     dl, 0
    je .done
    inc rax
    jmp .loop

.done:
    mov rax, rdi
    ret

section .note.GNU-stack noalloc noexec nowrite progbits