#ifndef _SPHERE_H_
#define _SPHERE_H_

#include <string>
#include <vector>
#include "Shape.h"  

using namespace std;

#define PI  3.14159265358979323846

class Sphere: public Shape {
public:
    Sphere(const string&, const double radius);
    ~Sphere() {}
    // void setRadius(const double radius);
    double getArea() const;
    double getVolume() const;
    string getInfo() const;
    bool test(const vector<string>& cond) const;

private:
    string name;
    double radius;
};

#endif