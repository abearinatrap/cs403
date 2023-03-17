#ifndef _CYLINDER_H_
#define _CYLINDER_H_

#include <string>
#include <vector>
#include "Shape.h"  

#define PI  3.14159265358979323846



class Cylinder: public Shape {
public:
    static const std::string shapetype;
    Cylinder(const std::string&, const double radius, const double height);
    ~Cylinder() {}
    
    double getArea() const;
    double getVolume() const;
    bool test(const std::vector<std::string>& cond) const;

    std::string getInfo() const;

private:
    double radius;
    double height;
};

#endif