#include "Vmy_exp.h"
#include "verilated.h"
#include <iostream>

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);
    Vmy_exp* top = new Vmy_exp;

    
    top->x = 4.0; 
    top->n = 10;  

    top->eval();

    std::cout << "exp(" << top->x << ") ≈ " << top->result << std::endl;

    delete top;
    return 0;
}