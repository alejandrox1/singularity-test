SRC=mpi_hello_world.c
EXEC=${SRC:.c=}
MPICC?=mpicc

.PHONY: all clean

all: ${SRC}
	${MPICC} -o ${EXEC} $^

clean:
	rm -f ${EXEC}
