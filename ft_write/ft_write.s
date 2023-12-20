section   .data
	extern __errno_location

section   .text
	global  ft_write
ft_write:
	mov         rax, 1                          ; system call for write
	syscall   
	cmp         rax, 0                          ; compare return value of write with 0
	jl          sys_error                       ; if (return_value < 0) sys_error();
	ret

sys_error:
	neg         rax								; return_value = abs(return_value_of_write)
	mov         rcx, rax						; save return_value in rcx
	call        __errno_location wrt ..plt      ; reference à l'entry table, get ptr on errno
	mov         [rax], rcx						; errno = abs(return_value)
	mov         rax, -1							; return (1)
	ret

;nasm -felf64 ft_write.s && gcc -Wall -Wextra -Werror ft_write.o main_ft_write.c && ./a.out