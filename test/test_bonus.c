#include "main.h"

int cmp_int(void *a, void *b)
{
    return (*(int *)a - *(int *)b);
}

void test_bonus(void)
{
    int num;

    num = ft_atoi_base("1010", "01");
    printf("ft_atoi_base(\"1010\", \"01\") = %d\n", num);

    num = ft_atoi_base("A", "0123456789ABCDEF");
    printf("ft_atoi_base(\"A\", \"0123456789ABCDEF\") = %d\n", num);

    num = ft_atoi_base("Z", "ABCDEFGHIJKLMNOPQRSTUVWXYZ");
    printf("ft_atoi_base(\"Z\", \"ABCDEFGHIJKLMNOPQRSTUVWXYZ\") = %d\n", num);

    t_list *list = NULL;
    ft_list_push_front(&list, strdup("First"));
    ft_list_push_front(&list, strdup("Second"));
    printf("List size after pushing two elements: %d\n", ft_list_size(list));

    ft_list_sort(&list, cmp_int);

    printf("List after sorting:\n");
    t_list *current = list;
    while (current)
    {
        printf("%s\n", (char *)current->data);
        current = current->next;
    }
    
    ft_list_remove_if(&list, "First", cmp_int, free);
    
    printf("List size after removing 'First': %d\n", ft_list_size(list));
    ft_list_remove_if(&list, "Second", cmp_int, free);
    
}