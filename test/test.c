#include "main.h"

void test()
{
    
    ////WRITE TESTS

    ssize_t i = ft_write(1, "Hello, World!\n", 14);
    errno = 0;
    ssize_t j = ft_write(10, "This is a test.\n", 17);
    int errno_read = errno;
    ssize_t k = ft_write(1, "test", 0);
    
    ssize_t i_compare = write(1, "Hello, World!\n", 14);
    errno = 0;
    ssize_t j_compare = write(10, "This is a test.\n", 17);
    int errno_read_compare = errno;
    ssize_t k_compare = write(1, "test", 0);
    printf("write(1, \"Hello, World!\\n\", 14) = %zd and ft_write(1, \"Hello, World!\\n\", 14) = %zd\n", i_compare, i);
    printf("write(10, \"This is a test.\\n\", 17) = %zd, errno = \"%s\" and ft_write(10, \"This is a test.\\n\", 17) = %zd, errno = \"%s\"\n", j_compare, strerror(errno_read_compare), j, strerror(errno_read));
    printf("write(1, \"test\", 0) = %zd and ft_write(1, \"test\", 0) = %zd\n", k_compare, k);
    
    ////READ TESTS

    char buffer[100] = { '\0' };
    char buffer_compare[100] = { '\0' };
    int bytes_read = ft_read(0, buffer, 1);
    int bytes_read_compare = read(0, buffer_compare, 1);

    printf("ft_read(0, buffer, 1) = '%s', size = '%d' and read(0, buffer, 1) = '%s', size = '%d'\n", buffer, bytes_read, buffer, bytes_read_compare);

    buffer[0] = '\0';
    buffer_compare[0] = '\0';
    errno = 0;
    bytes_read = ft_read(10, buffer, 10);
    errno_read = errno;
    errno = 0;
    bytes_read_compare = read(10, buffer_compare, 10);
    errno_read_compare = errno;
    printf("ft_read(10, buffer, 10) = '%s', size = '%d', errno = \"%s\" and read(10, buffer, 10) = '%s', size = '%d', errno = \"%s\"\n", buffer, bytes_read, strerror(errno_read), buffer_compare, bytes_read_compare, strerror(errno_read_compare));

    char *str = "Hello, World!";
    char *dup_str;
    printf("ft_strlen(\"%s\") = %zu\n", str, ft_strlen(str));
    printf("strlen(\"%s\") = %zu\n", str, strlen(str));
    printf("ft_strcmp(\"%s\", \"Hello, World!\") = %d and strcmp(\"%s\", \"Hello, World!\") = %d\n", str, ft_strcmp(str, "Hello, World!"), str, strcmp(str, "Hello, World!"));
    printf("ft_strcmp(\"%s\", \"Hello\") = %d and strcmp(\"%s\", \"Hello\") = %d\n", str, ft_strcmp(str, "Hello"), str, strcmp(str, "Hello"));
    printf("ft_strcmp(\"%s\", \"Hello, World!!\") = %d and strcmp(\"%s\", \"Hello, World!!\") = %d\n", str, ft_strcmp(str, "Hello, World!!"), str, strcmp(str, "Hello, World!!"));
    printf("strcmp(\"%s\", \"Hello, World!\") = %d\n", str, strcmp(str, "Hello, World!"));

    char dest[50];
    ft_strcpy(dest, str);
    printf("ft_strcpy(\"%s\") = \"%s\"\n", str, dest);
    dup_str = ft_strdup(str);
    printf("ft_strdup(\"%s\") = \"%s\"\n", str, dup_str);
    free(dup_str);
}