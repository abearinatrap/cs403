CC = g++
CFLAGS = -Wall -g -std=c++11 -o a.out

all: clean build

build: main

main: main.cpp Shape.o Cylinder.o Torus.o Box.o reading.h
	$(CC) $(CFLAGS) main.cpp Shape.cpp Sphere.cpp Cylinder.cpp Torus.cpp Box.cpp reading.cpp

clean:
	$(RM) *.o *.gch a.out