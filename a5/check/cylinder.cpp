#include "Shape.h"
#include "cylinder.h"
#include <sstream>
#include <iostream>
#include <iomanip>
using namespace std;

Cylinder::Cylinder(const string& name, const double radius, const double height)
    : Shape(name), radius(radius), height(height)
{  
}

double Cylinder::getArea() const {
    return 2 * PI * radius * height + 2 * PI * radius * radius;
}

double Cylinder::getVolume() const {
    return PI * radius * radius * height;
}

bool Cylinder::test(const vector<string>& cond) const{
    unsigned int size = cond.size();
    string shape = "cylinder";
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
                if ("cylinder" != value) return false;
            }
            else if (op == "!=") {
                if ("cylinder" == value) return false;
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

string Cylinder::getInfo() const {
    stringstream ss;
    ss << "Cylinder: " << fixed << setprecision(2) <<  getName() << ", Radius=" << radius << ", Height=" << height << "\n\tSurface Area: " << getArea() << ", Volume: " << getVolume();
    string info = ss.str();
    return info;
}