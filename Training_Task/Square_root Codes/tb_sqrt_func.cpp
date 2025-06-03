#include "Vsqrt_func.h"
#include "verilated.h"
#include <iostream>
#include <iomanip>
#include <cmath>

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
    Vsqrt_func* top = new Vsqrt_func;

    
    uint32_t input_fixed = 10 << 16;
    top->x = input_fixed;
    top->eval();

    double sqrt_result = static_cast<double>(top->result) / 65536.0;
    std::cout << std::fixed << std::setprecision(5);
    std::cout << "sqrt(10.0) ≈ " << sqrt_result << std::endl;

    delete top;
    return 0;
}
