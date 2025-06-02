def exp(x, n):
    result = 1  
    for i in range(1, n):  
        a = x ** i  
        b = a / factorial(i)  
        result += b  
    return result

def factorial(u): 
    if u == 0:
        return 1
    ans = 1
    for w in range(1, u + 1):
        ans *= w
    return ans

print(exp(4, 20))  
