# A make file by Patrick DuRussel II
CFLAGS=-I.

writer: writer.o 
	$(CC) -o writer writer.o 
	-rm *.o*

clean: 
	-rm *.o*

CROSS_COMPILE: writer.c
	aarch64-none-linux-gnu-gcc -o writer_cross writer.c
	
