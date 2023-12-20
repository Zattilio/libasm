/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jlanza <jlanza@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/20 12:18:23 by jlanza            #+#    #+#             */
/*   Updated: 2023/12/20 17:10:16 by jlanza           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include "libasm.h"

#define STR "\"\e[1;34m%s\e[0m\""
#define INTEGER "\033[33m%d\e[0m"

int main(void)
{
    printf("\n                              --- FT_STRLEN ---                                 \n");
    {
        char    *hello = "Hello World!";
        char    *empty = "";
        
        printf("length of "STR": "INTEGER"\n", hello, ft_strlen(hello));
        printf("length of "STR": "INTEGER"\n", empty, ft_strlen(empty));
    }
    
    printf("\n\n\n                              --- FT_STRCPY ---                                 \n");
    {
        char *hello = "Hello World!";
        char *empty = "";
        char cpy[50] = "";

        printf("original: "STR":\ncopy: "STR"\n", hello, ft_strcpy(cpy, hello));
        printf("original: "STR":\ncopy: "STR"\n", empty, ft_strcpy(cpy, empty));
    }
    
    printf("\n\n\n                              --- FT_STRCMP ---                                 \n");
    {
        char *hello_world = "Hello World!";
        char *hello = "Hello";

        int the_res = strcmp(hello, hello_world);
        int my_res = ft_strcmp(hello, hello_world);
        printf("strcmp: "INTEGER":\nft_strcmp: "INTEGER"\n", the_res, my_res);
        
        the_res = strcmp(hello_world, hello);
        my_res = ft_strcmp(hello_world, hello);
        printf("strcmp: "INTEGER":\nft_strcmp: "INTEGER"\n", the_res, my_res);
        
        the_res = strcmp(hello_world, hello_world);
        my_res = ft_strcmp(hello_world, hello_world);
        printf("strcmp: "INTEGER":\nft_strcmp: "INTEGER"\n", the_res, my_res);
    }
    
    printf("\n\n\n                              --- FT_WRITE ---                                  \n");
    {
        char hello[13] = "Hello World!\n";
        int res = 0;
        // SUCCESS
        printf("SUCCESS\n");
        res = ft_write(1, hello, 13);
        perror("error");
        printf("return value: "INTEGER"\n\n", res);
        
        printf("FAIL\n");
        res = ft_write(15, hello, 13);
        perror("error");
        printf("return value: "INTEGER"\n", res);
    }
    
    printf("\n\n\n                              --- FT_READ ---                                   \n");
    {
        int fd = open("./Makefile", O_RDONLY);
        char buffer[4096];
        //SUCCESS
        bzero(&buffer, sizeof(buffer));
        int ret = read(fd, buffer, 10);
        buffer[10] = '\0';
        printf("SUCCESS\nreturn value: "INTEGER"\nread bytes: "STR, ret, buffer);
        perror("errno");
        close(fd);
        // FAIL
        bzero(&buffer, sizeof(buffer));
        ret = read(fd, buffer, 10);
        buffer[10] = '\0';
        printf("\n\nFAIL\nreturn value: "INTEGER"\nread bytes: "STR, ret, buffer);
        perror("errno");
    }

    printf("\n\n\n                              --- FT_STRDUP ---                                 \n");
    {
        char *hello = "Hello World";
        char *cpy = NULL;

        cpy = ft_strdup(hello);
        printf("original: "STR":\ncopy: "STR"", hello, cpy);
        free(cpy);
    }

    return (0);
}