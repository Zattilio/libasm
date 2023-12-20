section .data
    extern  ft_strlen
    extern  ft_strcpy
    extern  malloc
    extern __errno_location

section .text
    global  ft_strdup

ft_strdup:
    push    rbx

    call    ft_strlen
    mov     rbx, rdi                            ; stock &str dans rbx
    mov     rdi, rax                            ; pass result of strlen(str) as arg of malloc
    inc     rdi                                 ; add one to strlen for ending byte '\0'
    call    malloc wrt ..plt 
    cmp     rax, 0
    je      error_malloc
    mov     rdi, rax                            ; put allocated malloc as first argument
    mov     rsi, rbx                            ; put rbx as second argument
    call    ft_strcpy

    pop     rbx
    ret

error_malloc:
    pop         rbx
    call        __errno_location wrt ..plt      ; reference à l'entry table, rax is now ptr on errno
    mov         dword [rax], 12
    mov         rax, 0
    ret
    
;nasm -felf64 ft_strdup.s ft_strlen.s ft_strcpy.s && gcc -Wall -Wextra -Werror ft_strcpy.o ft_strlen.o ft_strdup.o main_ft_strdup.c && ./a.out