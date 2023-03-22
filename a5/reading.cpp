#include "reading.h"
#include <fstream>
#include <sstream>
#include "Sphere.h"
#include "Cylinder.h"
#include "Torus.h"
#include "Box.h"
#include <iostream>

using namespace std;

vector<Shape*> *readFrom(string file) {
    vector<Shape*> *shapes = new vector<Shape*>;

    ifstream f;
    f.open(file);

    if (!f.is_open()) { 
        return shapes;
    }
    
    string line;

    while (getline(f, line)) {
        string s;
        vector<string> words;
        stringstream ss(line); 
        //get each word and place in words
        while (getline(ss,s,' ')) {
            words.push_back(s);
        }

        string type = words[1];
        if (type == "sphere") {
            double r = stod(words[2]);
            Sphere *shape = new Sphere( words[0], r);
            shapes->push_back(shape);
        }
        else if (type == "cylinder") {
            double r = stod(words[2]);
            double h = stod(words[3]);
            Cylinder *shape = new Cylinder(words[0], r, h);
            shapes->push_back(shape);
        }
        else if (type == "box") {
            double length = stod(words[2]);
            double width = stod(words[3]);
            double height = stod(words[4]);
            Box *shape = new Box(words[0], length, width, height);
            shapes->push_back(shape);
        }
        else if (type == "torus") {
            double smallR = stod(words[2]);
            double bigR = stod(words[3]);
            Torus *shape = new Torus(words[0], smallR, bigR);
            shapes->push_back(shape);
        }
    }
   
    return shapes;
}