#include "Shape.h"
#include "Sphere.h"
#include <sstream>
#include <string>
#include <iomanip>

using namespace std;

const std::string Sphere::shapetype = "sphere";

Sphere::Sphere(const string& name, const double radius)
   : Shape(name), radius(radius)
{
}

double Sphere::getArea() const {
    return 4 * PI * radius * radius;
}

double Sphere::getVolume() const {
    return 4/3 * PI * radius * radius * radius;
}

bool Sphere::test(const vector<string>& cond) const {
    size_t num_cond = cond.size();
    string name;
    string op;
    string value;

    for(int i=0; i<num_cond; i+=3){
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

string Sphere::getInfo() const {
    stringstream ss;
    ss << "Sphere: " << fixed << setprecision(2) <<  getName() << ", Radius=" << radius << "\n\tSurface Area: " << getArea() << ", Volume: " << getVolume();
    string info = ss.str();
    return info;
}