# Variables
CC = gcc
CFLAGS = -Wall -Wextra -Werror -lc
LDFLAGS = -L../build -lasm
LIB = ../build/libasm.a

SRC = main.c test.c test_bonus.c
EXE = test

all:
	$(CC) $(CFLAGS) -Iinclude $(SRC) $(LDFLAGS) -o $(EXE) 


clean:
	rm -f $(EXE)

fclean: clean

run: all
	./$(EXE)

re: fclean all

.PHONY: all clean test fclean re