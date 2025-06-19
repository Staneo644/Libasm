#include "main.h"

void list_push_front(t_list **begin_list, void *data) {
    t_list *new_node = malloc(sizeof(t_list));
    if (new_node == NULL) {
        return;
    }
    new_node->data = data;
    new_node->next = *begin_list;
    *begin_list = new_node;
}

void list_sort(t_list **begin_list, int (*cmp)()) {
    t_list *current;
    void *temp;
    
    if (begin_list == NULL || *begin_list == NULL) {
        return;
    }
    for (current = *begin_list; current->next != NULL; current = current->next) {
        if (cmp(current->data, current->next->data) > 0) {
            temp = current->data;
            current->data = current->next->data;
            current->next->data = temp;
            list_sort(begin_list, cmp);
            return;
        }
    }
}

void print_list(t_list *list) {
    while (list != NULL) {
        printf("%d ", *(int *)list->data);
        list = list->next;
    }
    printf("\n");
}

int cmp_int(void *a, void *b) {
    return (*(int *)a != *(int *)b);
    // (void)a;
    // (void)b;
    return 0;
}

void list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *))
{
    // printf("%p\n", **begin_list);
    t_list *current = *begin_list;
    t_list *prev = NULL;

    while (current != NULL) {
        if (cmp(current->data, data_ref) == 0) {
            if (prev == NULL) {
                *begin_list = current->next;
                if (free_fct)
                    free_fct(current->data);
                free(current);
                current = *begin_list;
            } else {
                prev->next = current->next;
                if (free_fct)
                    free_fct(current->data);
                free(current);
                current = prev->next;
            }
        } else {
            prev = current;
            current = current->next;
        }
    }
}
