%include "./list_struct.inc"

global ft_list_sort
section .text

ft_list_sort:
    push r12
    push r13
    push r14
    push r15
    push rbx

    xor rax, rax
    cmp rdi, 0
    je done
    mov r12, [rdi]
    mov r14, [rdi]
    mov r15, rsi

.loop:
    mov rdi, [r12 + T_LIST_DATA]
    mov r13, [r12 + T_LIST_NEXT]
    cmp r13, 0
    je done
    mov rsi, [r13 + T_LIST_DATA]
    call r15
    cmp eax, 0
    jg .swap

    mov r12, [r12 + T_LIST_NEXT]
    jmp .loop
 

.swap:
    mov rax, [r12 + T_LIST_DATA]
    mov rbx, [r13 + T_LIST_DATA]
    mov [r13 + T_LIST_DATA], rax
    mov [r12 + T_LIST_DATA], rbx
    mov r12, r14
    jmp .loop


done:
    pop rbx
    pop r15
    pop r14
    pop r13
    pop r12

    ret

section .note.GNU-stack noexec nowrite progbits noalloc