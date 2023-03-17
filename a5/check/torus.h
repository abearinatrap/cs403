#ifndef _TORUS_H_
#define _TORUS_H_

#include <string>
#include <vector>
#include "Shape.h"  

using namespace std;

#define PI  3.14159265358979323846

class Torus: public Shape {
public:
    Torus(const string&, const double smallRadius, const double bigRadius);
    ~Torus() {}
    // void setRadius(const double radius);
    double getArea() const;
    double getVolume() const;
    string getInfo() const;
    bool test(const vector<string>& cond) const;

private:
    string name;
    double smallRadius;
    double bigRadius;
};

#endif