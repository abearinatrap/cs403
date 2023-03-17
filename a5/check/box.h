#ifndef _BOX_H_
#define _BOX_H_

#include <string>
#include <vector>
#include "Shape.h"  

using namespace std;

#define PI  3.14159265358979323846

class Box: public Shape {
public:
    Box(const string&, const double length, const double width, const double height);
    ~Box() {}
    // void setRadius(const double radius);
    double getArea() const;
    double getVolume() const;
    string getInfo() const;
    bool test(const vector<string>& cond) const;

private:
    double length;
    double width;
    double height;
};

#endif