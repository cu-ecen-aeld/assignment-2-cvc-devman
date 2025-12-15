CROSS_COMPILE = native

ifeq ($(CROSS_COMPILE),aarch64-none-linux-gnu-)
	CC = $(CROSS_COMPILE)gcc
else
	CC = gcc
endif

all: writer
	echo "Compiling for $(CROSS_COMPILE)"

writer:
	$(CC) -o writer writer.c

clean:
	rm -f *.o writer