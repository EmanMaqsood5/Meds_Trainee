#include <stdio.h>
#include <math.h>


int factorial(int u) {
    if (u == 0) {
        return 1;
    }
    int ans = 1;
    for (int w = 1; w <= u; w++) {
        ans *= w;
    }
    return ans;
}


double my_exp(int x, int n) {
    double result = 1.0;
    for (int i = 1; i < n; i++) {
        double a = pow(x, i);              
        double b = a / factorial(i);       
        result += b;
    }
    return result;
}

int main() {
    printf("%f\n", my_exp(2, 20));  
    return 0;
}
