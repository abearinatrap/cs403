#ifndef _CYLINDER_H_
#define _CYLINDER_H_

#include <string>
#include <vector>
#include "Shape.h"  

using namespace std;

#define PI  3.14159265358979323846

class Cylinder: public Shape {
public:
    Cylinder(const string&, const double radius, const double height);
    ~Cylinder() {}
    // void setRadius(const double radius);
    double getArea() const;
    double getVolume() const;
    string getInfo() const;
    bool test(const vector<string>& cond) const;

private:
    double radius;
    double height;
};

#endif