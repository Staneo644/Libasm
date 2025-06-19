%include "./list_struct.inc"

global ft_list_size
section .text

ft_list_size:
    xor rax, rax
    cmp rdi, 0
    je done

.jump:
    cmp rdi, 0
    je done
    mov rdi, [rdi + T_LIST_NEXT]
    inc rax
    jmp .jump
 
done:
    ret

section .note.GNU-stack noexec nowrite progbits noalloc