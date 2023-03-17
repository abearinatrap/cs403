#include "reading.h"
#include <fstream>
#include <sstream>
#include "sphere.h"
#include "cylinder.h"
#include "torus.h"
#include "box.h"
#include <iostream>

using namespace std;

vector<Shape*> *readFrom(string file) {
    string line;
    ifstream f;
    f.open(file);
    string s;
    vector<Shape*> *shapes = new vector<Shape*>;

    if (!f.is_open()) { 
        return shapes;
    }
    vector<string> eachLine;
    while (getline(f, line)) { // each line of file
        eachLine.clear();
        stringstream ss(line); 
        while (getline(ss,s,' ')) { // each word sep by whitespace
            eachLine.push_back(s);
        }
        string type = eachLine.at(1);
        if (type == "sphere") {
            double r =  stod(eachLine.at(2));
            string name = eachLine.at(0);
            Sphere *shape = new Sphere(name, r);
            shapes->push_back(shape);
        }
        else if (type == "cylinder") {
            double r = stod(eachLine.at(2));
            double h = stod(eachLine.at(3));
            string name = eachLine.at(0);
            Cylinder *shape = new Cylinder(name, r, h);
            shapes->push_back(shape);
        }
        else if (type == "torus") {
            double smallR = stod(eachLine.at(2));
            double bigR = stod(eachLine.at(3));
            string name = eachLine.at(0);
            Torus *shape = new Torus(name, smallR, bigR);
            shapes->push_back(shape);
        }

        else if (type == "box") {
            double length = stod(eachLine.at(2));
            double width = stod(eachLine.at(3));
            double height = stod(eachLine.at(4));
            string name = eachLine.at(0);
            Box *shape = new Box(name, length, width, height);
            shapes->push_back(shape);
        }
    }
   
    return shapes;
}