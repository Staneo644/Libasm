%include "./list_struct.inc"

global ft_create_elem
section .text

ft_create_elem:
    push r12
    extern malloc
    mov     r12, rdi
    mov     rdi, T_LIST_SIZE
    call malloc wrt ..plt
    cmp     rax, 0
    je .done
    mov     QWORD [rax + T_LIST_DATA], r12
    mov     QWORD [rax + T_LIST_NEXT], 0
    jmp .done

.done:
    pop r12
    ret

section .note.GNU-stack progbits