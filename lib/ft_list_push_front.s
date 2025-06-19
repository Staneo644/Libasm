%include "./list_struct.inc"

global ft_list_push_front
section .text

ft_list_push_front:
    extern ft_create_elem
    push r13
    push r14
    sub rsp, 8
    
    xor rax, rax
    cmp rdi, 0
    je done
    
    mov r13, rdi
    mov rdi, rsi
    call ft_create_elem
    cmp rax, 0
    je done

    mov r14, [r13]
    mov [rax + T_LIST_NEXT], r14
    mov [r13], rax  
 
done:
    add rsp, 8
    pop r14
    pop r13
    ret

section .note.GNU-stack noexec nowrite progbits