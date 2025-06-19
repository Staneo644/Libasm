%include "./list_struct.inc"

global ft_list_remove_if
section .text
extern free
;r12 = t_list **begin_list
;r13 = t_list *current
;r14 = t_list *previous

ft_list_remove_if:
    push r12
    push r13
    push r14
    push r15
    push rbx

    cmp rdi, 0
    je done
    xor r14, r14
    mov rbx, rdx
    mov r12, rdi
    mov r10, rsi
    mov r13, [rdi]
    mov r15, rcx
    xor rdi, rdi
    jmp .jump

.jump:
    cmp r13, 0
    je done
    mov rdi, [r13 + T_LIST_DATA]
    mov rsi, r10
    call rbx
    cmp eax, 0
    je .remove
    mov r14, r13
    mov r13, [r13 + T_LIST_NEXT]
    jmp .jump

.head:
    mov r8, [r12]
    mov r8, [r8 + T_LIST_NEXT]
    mov [r12], r8
    cmp r15, 0
    je .next_head
    call r15
    jmp .next_head
    
.next_head:
    mov rdi, r13
    mov r13, [r13 + T_LIST_NEXT]
    call free wrt ..plt
    jmp .jump

.remove:
    cmp r14, 0
    je .head
    mov r8, [r13 + T_LIST_NEXT]
    mov [r14 + T_LIST_NEXT], r8
    
    cmp r15, 0
    je .next_remove
    call r15
    jmp .next_remove

.next_remove:
    mov rdi, r13
    mov r13, [r13 + T_LIST_NEXT]
    call free wrt ..plt
    jmp .jump
 
done:
    pop rbx
    pop r15
    pop r14
    pop r13
    pop r12
    ret

section .note.GNU-stack noexec nowrite progbits