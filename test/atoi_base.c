#include "main.h"

int atoi_base(char *str, char *base) {
    int len_base = strlen(base);
    if (strlen(str) == 0 || len_base == 0) {
        return 0;
    }
    for (int i = 0; base[i] != '\0'; i++) {
        for (int j = i + 1; base[j] != '\0'; j++) {
            if (base[i] == base[j]) {
                return 0;
            }
        }
        if (base[i] == '-' || base[i] == '+' || base[i] == ' ' || base[i] <= 32) {
            return 0;
        }
    }
    
    int sign = 1;
    int start = 0;
    int result = 0;
    while (str[start] == ' ' || str[start] == '-' || str[start] == '+') {
        if (str[start] == '-') {
            sign *= -1;
        }
        start++;
    }
    for (; str[start]; start++) {
        for (int j = 0; ; j++) {
            if (base[j] == 0)
                return 0;
            if (str[start] == base[j]) {
                result = result * len_base + j;
                break; 
            }
        }
    }
    return sign * result;
}
