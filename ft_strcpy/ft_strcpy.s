section .text
    global  ft_strcpy

ft_strcpy:
    mov     rax, rdi
    mov     rcx, 0
    jmp     loop

loop:
    cmp     byte [rsi + rcx], 0
    je      end_loop
    mov     dl, byte [rsi + rcx]
    mov     byte [rdi + rcx], dl
    inc     rcx
    jmp     loop

end_loop:
    mov     byte [rdi + rcx], 0
    ret

;nasm -felf64 ft_strcpy.s && gcc -Wall -Wextra -Werror ft_strcpy.o main_ft_strcpy.c && ./a.out