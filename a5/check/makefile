CC = g++
CFLAGS = -Wall -g -std=c++11 -o a.out

all: clean build

build: main.o

main: main.o Shape.o Sphere.o Cylinder.o Torus.o Box.o reading.o
	$(CC) $(CFLAGS) -o main main.o Shape.o Sphere.o Cylinder.o Torus.o Box.o reading.o

main.o: main.cpp Shape.o Cylinder.o Torus.o Box.o reading.h
	$(CC) $(CFLAGS) main.cpp Shape.cpp sphere.cpp cylinder.cpp torus.cpp box.cpp reading.cpp
 
Shape.o: Shape.h
 
Sphere.o: Sphere.h Shape.h

Cylinder.o : cylinder.h Shape.h

Torus.o : torus.h Shape.h

Box.o : box.h Shape.h

reading.o: reading.h

clean:
	$(RM) *.o *.gch