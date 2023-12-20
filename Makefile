# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jlanza <jlanza@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/20 14:10:55 by jlanza            #+#    #+#              #
#    Updated: 2023/12/20 16:26:32 by jlanza           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC =	ft_read/ft_read.s \
		ft_strcmp/ft_strcmp.s \
		ft_strcpy/ft_strcpy.s \
		ft_strdup/ft_strdup.s \
		ft_strlen/ft_strlen.s \
		ft_write/ft_write.s

OBJ = ${SRC:.s=.o}

AR = ar rcs
NAME = libasm.a

NASMFLAGS = -felf64
NASM = nasm

CC = cc 
CFLAGS = -Wall -Wextra -Werror
EXEC = main_test

RM = rm -f
HEADER =	libasm.h

%.o : %.s
	$(NASM) $(NASMFLAGS) $< -o $@

$(NAME): $(OBJ) $(HEADER)
	$(AR) $(NAME) $(OBJ)

all: $(NAME)

clean:
	$(RM) $(OBJ) main.o

fclean: clean
	$(RM) $(NAME) main_test

re: fclean all

main: all
	clear
	$(CC) $(CFLAGS) main.c -o $(EXEC) -L. -lasm
	./$(EXEC)
	
.PHONY: all clean fclean re main