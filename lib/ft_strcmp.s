global ft_strcmp
section .text

ft_strcmp:
    xor rax, rax

.loop:
    mov     dl, byte [rsi + rax]
    mov     cl, byte [rdi + rax]
    cmp     dl, cl
    jl .less
    jg .greater
    cmp cl, 0
    je .equal
    inc rax
    jmp .loop


.greater:
    mov rax, -1
    jmp .done

.less:
    mov rax, 1
    jmp .done

.equal:
    mov rax, 0
    jmp .done

.done:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits