#include "Shape.h"
#include "torus.h"
#include <sstream>
#include <iostream>
#include <iomanip>
using namespace std;

Torus::Torus(const string& name, const double smallRadius, const double bigRadius)
    : Shape(name), smallRadius(smallRadius), bigRadius(bigRadius)
{  
}

double Torus::getArea() const {
    return 2 * PI * bigRadius * 2 * PI * smallRadius;
}

double Torus::getVolume() const {
    return PI * smallRadius * 2 * PI * bigRadius;
}

bool Torus::test(const vector<string>& cond) const{
    unsigned int size = cond.size();
    string shape = "torus";
    string type;
    string op;
    string value;
    for (unsigned int i = 0; i < size; i++) {
        // Name
        type = cond.at(i);
        i++;
        // Operator
        op = cond.at(i);
        i++;
        // Value
        value = cond.at(i);

        if (type == "type") {
            if (op == "==") {
                if ("torus" != value) return false;
            }
            else if (op == "!=") {
                if ("torus" == value) return false;
            }
            else if (op == ">=") {
                if (shape.compare(value) < 0) return false;
            }
            else if (op == "<=") {
                if (shape.compare(value) > 0) return false;
            }
            else if (op == ">") {
                if (shape.compare(value) <= 0) return false;
            }
            else if (op == "<") {
                if (shape.compare(value) >= 0) return false;
            }
        }
        else if (type == "area") {
            if (op == "==") {
                if (getArea() != stod(value)) return false;
            }
            else if (op == "!=") {
                if (getArea() == stod(value)) return false;
            }
            else if (op == ">=") {
                if (getArea() < stod(value)) return false;
            }
            else if (op == "<=") {
                if (getArea() > stod(value)) return false;
            }
            else if (op == ">") {
                if (getArea() <= stod(value)) return false;
            }
            else if (op == "<") {
                if (getArea() >= stod(value)) return false;
            }
        }
        else if (type == "volume") {
            if (op == "==") {
                if (getVolume() != stod(value)) return false;
            }
            else if (op == "!=") {
                if (getVolume() == stod(value)) return false;
            }
            else if (op == ">=") {
                if (getVolume() < stod(value)) return false;
            }
            else if (op == "<=") {
                if (getVolume() > stod(value)) return false;
            }
            else if (op == ">") {
                if (getVolume() <= stod(value)) return false;
            }
            else if (op == "<") {
                if (getVolume() >= stod(value)) return false;
            }
        }
    }
    return true;
}

string Torus::getInfo() const {
    stringstream ss;
    ss << "Torus: " << fixed << setprecision(2) <<  getName() << ", Small Radius=" << smallRadius << ", Big Radius=" << bigRadius << "\n\tSurface Area: " << getArea() << ", Volume: " << getVolume();
    string info = ss.str();
    return info;
}