#ifndef _BOX_H_
#define _BOX_H_

#include <string>
#include <vector>
#include "Shape.h"  

#define PI  3.14159265358979323846



class Box: public Shape {
public:
    static const std::string shapetype;
    Box(const std::string&, const double length, const double width, const double height);
    ~Box() {}
    
    double getArea() const;
    double getVolume() const;
    bool test(const std::vector<std::string>& cond) const;

    std::string getInfo() const;

private:
    double length;
    double width;
    double height;
};

#endif