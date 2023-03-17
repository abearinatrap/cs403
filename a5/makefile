CC = g++
CFLAGS = -Wall -g -std=c++20 -o a.out

all: clean build

build: main.o

main: main.o Shape.o Sphere.o Cylinder.o Torus.o Box.o reading.o
	$(CC) $(CFLAGS) -o main main.o Shape.o Sphere.o Cylinder.o Torus.o Box.o reading.o

main.o: main.cpp Shape.o Cylinder.o Torus.o Box.o reading.h
	$(CC) $(CFLAGS) main.cpp shape.cpp sphere.cpp cylinder.cpp torus.cpp box.cpp reading.cpp
 
Shape.o: Shape.h
 
Sphere.o: Sphere.h Shape.h

Cylinder.o : Cylinder.h Shape.h

Torus.o : Torus.h Shape.h

Box.o : Box.h Shape.h

reading.o: reading.h

clean:
	$(RM) *.o *.gch a.out