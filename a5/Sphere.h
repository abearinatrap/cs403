#ifndef _SPHERE_H_
#define _SPHERE_H_

#include <string>
#include <vector>
#include "Shape.h"  

#define PI  3.14159265358979323846



class Sphere: public Shape {
public:
    static const std::string shapetype;
    Sphere(const std::string&, const double radius);
    ~Sphere() {}
    
    double getArea() const;
    double getVolume() const;
    bool test(const std::vector<std::string>& cond) const;

    std::string getInfo() const;

private:
    double radius;
};

#endif