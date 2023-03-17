#include "Shape.h"
#include "box.h"
#include <sstream>
#include <iostream>
#include <iomanip>
using namespace std;

Box::Box(const string& name, const double length, const double width, const double height)
    : Shape(name), length(length), width(width), height(height)
{  
}

double Box::getArea() const {
    return 2 * length * width + 2 * length * height + 2 * height * width;
}

double Box::getVolume() const {
    return length * width * height;
}

bool Box::test(const vector<string>& cond) const{
    unsigned int size = cond.size();
    string shape = "box";
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
                if ("box" != value) return false;
            }
            else if (op == "!=") {
                if ("box" == value) return false;
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

string Box::getInfo() const {
    stringstream ss;
    ss << "Box: " << fixed << setprecision(2) <<  getName() << ", Length=" << length << ", Width=" << width << ", Height=" << height << "\n\tSurface Area: " << getArea() << ", Volume: " << getVolume();
    string info = ss.str();
    return info;
}