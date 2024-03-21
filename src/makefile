NAME=rand

all: $(NAME).o
	ld -o $(NAME) $(NAME).o
	@rm *.o

%.o: %.asm
	@rm $(NAME)
	nasm -g -f elf64 $<