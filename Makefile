CC = gcc
CFLAGS = -Wall -Wextra -pedantic -std=c99 -Werror

all: bcrypt.a

test: bcrypt.c
	$(CC) $(CFLAGS) -DTEST_BCRYPT -c bcrypt.c
	$(CC) -o bcrypt_test bcrypt.o

bcrypt.a: bcrypt.o
	ar r bcrypt.a bcrypt.o

bcrypt.o: bcrypt.c
	$(CC) $(CFLAGS) -c bcrypt.c

clean:
	rm -f *.o bcrypt_test bcrypt.a *~ core
