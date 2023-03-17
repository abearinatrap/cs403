#include "Shape.h"
#include "Torus.h"
#include <sstream>
#include <string>
#include <iostream>
#include <iomanip>

using namespace std;

const std::string Torus::shapetype = "torus";

Torus::Torus(const string& name, const double smallRadius, const double bigRadius)
    : Shape(name), smallRadius(smallRadius), bigRadius(bigRadius)
{  
}

double Torus::getArea() const {
    return 2 * PI * bigRadius * 2 * PI * smallRadius;
}

double Torus::getVolume() const {
    return PI * smallRadius * smallRadius * 2 * PI * bigRadius;
}

bool Torus::test(const vector<string>& cond) const {
    size_t num_cond = cond.size();
    string name;
    string op;
    string value;

    for(uint i=0; i<num_cond; i+=3){
        name = cond[i];
        op = cond[i+1];
        value = cond[i+2];
        if (name == "type"){
            if (op == "==") {
                if (shapetype != value) return false;
            }
            else if (op == "!=") {
                if (shapetype == value) return false;
            }
            else if (op == ">=") {
                if (shapetype.compare(value) < 0) return false;
            }
            else if (op == "<=") {
                if (shapetype.compare(value) > 0) return false;
            }
            else if (op == ">") {
                if (shapetype.compare(value) <= 0) return false;
            }
            else if (op == "<") {
                if (shapetype.compare(value) >= 0) return false;
            }
        }
        else if (name == "area") {
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
        else if (name == "volume") {
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