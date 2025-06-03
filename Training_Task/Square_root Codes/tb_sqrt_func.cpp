#include "Vsqrt_func.h"
#include "verilated.h"
#include <iostream>
#include <cmath>
#include <iomanip>

int main() {
    Vsqrt_func* top = new Vsqrt_func;

    uint32_t x = 10;
    top->x = x;
    top->eval();

    std::cout << std::fixed << std::setprecision(5);
    std::cout << std::sqrt(static_cast<double>(x)) << std::endl;

    delete top;
    return 0;
} -