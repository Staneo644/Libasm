extern __errno_location
global ft_write
section .text

ft_write:
    push r12
    mov rax, 1
    syscall

    cmp rax, 0
    jge .done
    
    neg rax
    mov r12, rax
    call __errno_location wrt ..plt
    mov [rax], r12
    mov rax, -1
    jmp .done

.done:
    pop r12
    ret

section .note.GNU-stack noalloc noexec progbits