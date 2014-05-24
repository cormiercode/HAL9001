# Makefile for HAL9001 main code


CFLAGS=-O2
LFLAGS=
RM=rm -f
INCLUDES=src
OBJS=cubex.o
LIBS=

all: solve

solve: obj/solve.o obj/moves.o
	gcc -g obj/solve.o obj/moves.o -o solve

obj/moves.o: src/moves.c src/moves.h src/structures.h
	gcc -c -g src/moves.c -o obj/moves.o

obj/solve.o: src/solve.c src/solve.h src/structures.h
	gcc -c -g src/solve.c -o obj/solve.o
	
heuristic: obj/moves.o gen_heuristic/obj/gen_heuristic.o
	gcc -g obj/moves.o gen_heuristic/obj/gen_heuristic.o -o gen_heuristic/gen_heuristic
	
gen_heuristic/obj/gen_heuristic.o: gen_heuristic/gen_heuristic.c gen_heuristic/gen_heuristic.h
	gcc -c -g gen_heuristic/gen_heuristic.c -o gen_heuristic/obj/gen_heuristic.o
	
clean:
	rm -f obj/*
	rm -f gen_heuristic/obj/*
	rm -f *.exe
	rm -f gen_heuristic/*.exe
	rm -f gen_heuristic/*.stackdump
	rm -f *.stackdump
    


dummy:
