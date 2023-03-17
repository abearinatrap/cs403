#ifndef _TORUS_H_
#define _TORUS_H_

#include <string>
#include <vector>
#include "Shape.h"  

#define PI  3.14159265358979323846



class Torus: public Shape {
public:
    static const std::string shapetype;
    Torus(const std::string&, const double smallRadius, const double bigRadius);
    ~Torus() {}

    double getArea() const;
    double getVolume() const;
    bool test(const std::vector<std::string>& cond) const;

    std::string getInfo() const;

private:
    double smallRadius;
    double bigRadius;
};

#endif