import numpy as np

def NegativeWrappedConv(a,b,psi,psi_inv,prime):
    a_dot = a * psi
    b_dot = b * psi
    c_dot = a_dot * b_dot
    print(a_dot)
    print(b_dot)
    return c_dot

def find_mod_inv(a,m):
    for x in range(1,m):
        if((a%m)*(x%m) % m==1):
            return x


def main():
    a = np.array([1,2,3,0,0,0,0,0])
    b = np.array([4,5,6,0,0,0,0,0])
    w = 5
    prime = 313

    psi = np.array([w**0,w**1,w**2,w**3,w**4,w**5,w**6,w**7]) % prime
    psi_inv = np.array([1, 188, 288, 308, 312, 125, 25, 5]) % prime

    c = NegativeWrappedConv(a,b,psi,psi_inv, prime)%prime
    print(c)
main()