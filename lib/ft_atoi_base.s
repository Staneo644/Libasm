default rel
bits 64

extern printf
extern puts
extern ft_strlen

section .data
    msg db "Debug message", 0

global ft_atoi_base
section .text
; r8 = str, r9 = base, r10 = base_len, r11 = sign, r12 = result
ft_atoi_base:
    push r12
    push r13
    push r14

    xor rax, rax
    mov r8, rdi
    mov r9, rsi
    call ft_strlen
    cmp rax, 0
    je .done
    xor rax, rax
    mov rdi, r9
    call ft_strlen
    mov r10, rax
    cmp r10, 0
    je .done
    xor rax, rax


.loop:
    mov r11b, byte [r9 + rax]
    cmp r11b, 0
    je .after_loop
    mov r12, rax
    cmp r11b, '-'
    je .exit
    cmp r11b, '+'
    je .exit
    cmp r11b, ' '
    je .exit
    cmp r11b, 32
    jl .exit
    inc rax

.loop2:
    cmp r11b, byte [r9 + rax]
    je .exit
    inc rax
    cmp rax, r10
    jl .loop2
    mov rax, r12
    inc rax
    jmp .loop

    


.after_loop:
    xor r11, r11
    xor r12, r12
    xor rax, rax
    mov r11b, 1

.big_loop:
    mov r13b, byte [r8 + rax]
    inc rax
    cmp r13b, 0
    je .done
    cmp r13b, '-'
    je .change_sign
    cmp r13b, '+'
    je .big_loop
    cmp r13b, ' '
    je .big_loop
    dec rax

.second_loop:
    mov r13b, byte [r8 + rax]
    inc rax
    cmp r13b, 0
    je .success
    mov rcx, r10

    .third_loop:
        mov r14b, byte [r9 + rcx - 1]
        cmp r13b, r14b
        je .found
        dec rcx
        jnz .third_loop
        jmp .exit

    .found:
        imul r12, r10
        dec rcx
        add r12, rcx
        jmp .second_loop

.change_sign:
    imul r11, -1
    jmp .big_loop

.success:
    mov rax, r12
    imul r11
    jmp .done

.exit:
    xor rax, rax
    jmp .done

.done:
    pop r14
    pop r13
    pop r12
    ret

section .note.GNU-stack noalloc noexec nowrite progbits