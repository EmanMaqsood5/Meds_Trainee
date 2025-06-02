def sqrt_func(x):

    if x == 0 or x == 1:
        return x
 
    if x > 1 :
        low=0
        high=x
        mid = (low + high) / 2

    
    while abs(mid * mid - x) > 0.00001:
        if mid * mid < x:
            low = mid
        else:
            high = mid
        mid = (low + high) / 2

    return mid
print(sqrt_func(10))
