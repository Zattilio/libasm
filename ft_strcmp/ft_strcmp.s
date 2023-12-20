section .text
    global  ft_strcmp

ft_strcmp:                                      ; with str1 as rdi and str2 as rsi
    mov     rcx, 0                              ; int i = 0
    jmp     loop                                ; start loop

loop:
    mov     dl, byte [rsi + rcx]                ; dl = str2[i]
    cmp     byte [rdi + rcx], 0                 ; compare str1[i] and 0
    je      end_loop                            ; if(str1[i] == 0) endloop
    cmp     dl, byte [rdi + rcx]                ; compare str1[i] and str2[i]
    jne     end_loop                            ; if (str1[i] != str2[i]) endloop
    inc     rcx                                 ; i++
    jmp     loop                                ; start loop again

end_loop:
    mov     rdx, 0                              ; rdx = 0
    mov     r8, 0                               ; r8 = 0
    mov     dl, byte[rdi + rcx]                 ; rdx = str2[i] (only modify last byte of rdx)
    mov     r8b, byte[rsi + rcx]                ; r8 = str2[i] (only modify last byte of r8)
    sub     rdx, r8                             ; rdx = rdx - r8
    mov     rax, rdx                            ; return_value = rdx 
    ret                                         ; return (return_value)

;nasm -felf64 ft_strcmp.s && gcc -Wall -Wextra -Werror ft_strcmp.o main_ft_strcmp.c && ./a.out