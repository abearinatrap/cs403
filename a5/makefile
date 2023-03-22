CC = g++
OFLAGS = -Wall -std=c++11 -g -c
BFLAGS = -Wall -g -std=c++11 -o a.out


all: clean build

build: main.o shape.o sphere.o box.o cylinder.o torus.o reading.o
	$(CC) $(BFLAGS) main.o shape.o sphere.o box.o cylinder.o torus.o reading.o

main.o: main.cpp shape.o reading.o
	$(CC) $(OFLAGS) main.cpp

shape.o: Shape.h Shape.cpp
	$(CC) $(OFLAGS) Shape.cpp -o shape.o

sphere.o: shape.o Sphere.h Sphere.cpp
	$(CC) $(OFLAGS) Sphere.cpp -o sphere.o

box.o: shape.o Box.h Box.cpp
	$(CC) $(OFLAGS) Box.cpp -o box.o

cylinder.o: shape.o Cylinder.h Cylinder.cpp
	$(CC) $(OFLAGS) Cylinder.cpp -o cylinder.o

torus.o: shape.o Torus.h Torus.cpp
	$(CC) $(OFLAGS) Torus.cpp -o torus.o

reading.o: reading.h reading.cpp 
	$(CC) $(OFLAGS) reading.cpp -o reading.o

clean:
	$(RM) *.o *.gch a.out