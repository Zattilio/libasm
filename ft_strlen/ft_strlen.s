section .text
    global  ft_strlen

ft_strlen:
    mov     rax, 0
    jmp     loop

loop:
    cmp     byte [rdi + rax], 0
    je      end_loop
    inc     rax
    jmp     loop

end_loop:
    ret
;nasm -felf64 ft_strlen.s && gcc -Wall -Wextra -Werror ft_strlen.o main_ft_strlen.c && ./a.out