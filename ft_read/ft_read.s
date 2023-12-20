section   .data
	extern __errno_location

section   .text
	global  ft_read
ft_read:
	mov         rax, 0                          ; system call for read
	syscall   
	cmp         rax, 0                          ; compare return value of read with 0
	jl          sys_error                       ; if (return_value < 0) sys_error();
	ret

sys_error:
	neg         rax								; return_value = abs(return_value_of_read)
	mov         rcx, rax						; save return_value in rcx
	call        __errno_location wrt ..plt      ; reference à l'entry table, get ptr on errno
	mov         [rax], rcx						; errno = abs(return_value)
	mov         rax, -1							; return (1)
	ret

;nasm -felf64 ft_read.s && gcc -Wall -Wextra -Werror ft_read.o main_ft_read.c && ./a.out