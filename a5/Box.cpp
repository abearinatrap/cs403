#include "Shape.h"
#include "Box.h"
#include <sstream>
#include <iomanip>

using namespace std;

const std::string Box::shapetype = "box";

Box::Box(const std::string& name, const double length, const double width, const double height)
   : Shape(name), length(length), width(width), height(height)
{
}

double Box::getArea() const {
    return 2 * length * width + 2 * length * height + 2 * height * width;
}

double Box::getVolume() const {
    return length * width * height;
}

bool Box::test(const vector<string>& cond) const {
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

string Box::getInfo() const {
    stringstream ss;
    ss << "Box: " << fixed << setprecision(2) <<  getName() << ", Length=" << length << ", Width=" << width << ", Height=" << height << "\n\tSurface Area: " << getArea() << ", Volume: " << getVolume();
    string info = ss.str();
    return info;
}