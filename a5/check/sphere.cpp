#include "Shape.h"
#include "sphere.h"
#include <sstream>
#include <iostream>
#include <iomanip>
using namespace std;

Sphere::Sphere(const string& name, const double radius)
    : Shape(name), radius(radius)
{  
}

// void Sphere::setRadius(double radius) {
//     this->radius = radius;
// }

double Sphere::getArea() const {
    return 4 * PI * radius * radius;
}

double Sphere::getVolume() const {
    return 4 *  PI * radius * radius * radius /3;
}

bool Sphere::test(const vector<string>& cond) const{
    unsigned int size = cond.size();
    string shape = "sphere";
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
                if ("sphere" != value) return false;
            }
            else if (op == "!=") {
                if ("sphere" == value) return false;
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

string Sphere::getInfo() const {
    stringstream ss;
    ss << "Sphere: " << fixed << setprecision(2) <<  getName() << ", Radius=" << radius << "\n\tSurface Area: " << getArea() << ", Volume: " << getVolume();
    string info = ss.str();
    return info;
}