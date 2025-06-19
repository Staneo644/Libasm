OBJ_DIR = ../build
NASM = nasm
NASMFLAGS = -f elf64 
ASM_FILES := $(wildcard *.s)
OBJ_FILES_ASM := $(patsubst %.s, $(OBJ_DIR)/%.o, $(ASM_FILES))

LIB = $(OBJ_DIR)/libasm.a

$(OBJ_DIR)/%.o: %.s
	@mkdir -p $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

$(LIB): $(OBJ_FILES_ASM)
	ar rcs $@ $^

clean:
	rm -rf $(OBJ_DIR)/*.o

fclean:
	rm -rf $(OBJ_DIR)
	rm -f $(LIB)

re: fclean all

all: $(LIB)

.PHONY: all clean fclean re