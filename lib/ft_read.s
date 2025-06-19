global ft_read
extern __errno_location
section .text

ft_read:
    push r12
    mov rax, 0
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