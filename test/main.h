#ifndef MAIN_H
#define MAIN_H
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h> 
#include <unistd.h>

// #include "libasm"

void test();
void test_bonus();

extern size_t ft_strlen(const char* str);
extern int ft_strcmp(const char* str1, const char* str2);
extern char* ft_strcpy(char* dest, const char* src);
extern char* ft_strdup(const char* s1);
extern ssize_t ft_write(int fd, const void* buf, size_t count);
extern ssize_t ft_read(int fd, void* buf, size_t count);

extern int ft_atoi_base(const char* str, const char* base);

typedef struct s_list
{
    char *data;
    struct s_list *next;
} t_list;
int cmp_int(void *a, void *b);

extern void ft_list_push_front(t_list **begin_list, void *data);
extern int ft_list_size(t_list *begin_list);
extern void ft_list_sort(t_list **begin_list, int (*cmp)());
extern void ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));


#endif