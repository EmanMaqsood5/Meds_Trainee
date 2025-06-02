#include <stdio.h>
#include <stdlib.h>
#include <math.h>  

double sqrt_func(int x) {
    if (x == 0 || x == 1) {
        return x;
    }

    double low = 0;
    double high = x;
    double mid = (low + high) / 2;

    
    while (fabs(mid * mid - x) > 0.00001) {
        if (mid * mid < x) {
            low = mid;
        } else {
            high = mid;
        }
        mid = (low + high) / 2;
    }

    return mid;
}

int main() {
    printf("%f\n", sqrt_func(64));  // Should print approximately 8.0
    return 0;
}
