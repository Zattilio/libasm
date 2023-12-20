/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jlanza <jlanza@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/20 12:23:41 by jlanza            #+#    #+#             */
/*   Updated: 2023/12/20 15:30:28 by jlanza           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

extern ssize_t  ft_read(int fildes, void *buf, size_t nbyte);
extern  int     ft_strcmp(const char *s1, const char *s2);
extern  char    *ft_strcpy(char *dest, char *cpy);
extern  char    *ft_strdup(char *str);
extern  int     ft_strlen(char *str);
extern ssize_t  ft_write(int fildes, const void *buf, size_t nbyte);

#endif