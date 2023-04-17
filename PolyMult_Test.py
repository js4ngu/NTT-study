#!python3

import time

from test_helper import *

'''
Z_q[x]/(x^n-1)
Z_q[x]/(x^n+1)

Coefficient Field : Z_q                 //  Crypto Ring
Function Field : (x^n-1) or (x^n+1)     //  for NTT


ZCash
'''

# Parameter and Datas
'''
q = 2**251+17*2**192+1  // g = 7
q = 2**64-2**32+1
q = 2**31-1
q = 97

n = 8                 # Number of Coefficient
d_max = 2**3

A = [randint(0, q-1) for _ in range(n-1)] + [randint(1, q-1)]
B = [randint(0, q-1) for _ in range(n-1)] + [randint(1, q-1)]
f = [1] + [0 for _ in range(n-1)] + [1]
'''

# p = prime which q-1 is dividable by n
# n = 2^k   now, only 8 butterfly unit..

# Example 01
# Cyclic Convolution Test
# + Modulo Function is x^n - 1
def Example01(n, q, g):
    A = [randint(0, q-1) for _ in range(n-1)] + [randint(1, q-1)]
    B = [randint(0, q-1) for _ in range(n-1)] + [randint(1, q-1)]
    f = [-1] + [0 for _ in range(n-1)] + [1]        # Cyclic Conv

    print("##### Example 01 (CC) #####")

    print("[Polynomials]")
    print("A      :", A)
    print("B      :", B)
    print("M      :", f)

    # Polynomial multiplication

    print()
    print("[Result]")

    start = time.time()
    C = multPolyNaive(A, B, f, q)
    naiveT = time.time() - start
    print("Naive  :", C)

    start = time.time()
    C_ntt = multPolyNTT(A, B, q, n, g)
    nttT = time.time() - start
    print("NTT    :", C_ntt)


    print( C_ntt == C, naiveT, nttT)
    print()

# Example 02
# Negative Wrapped Convolution Test
# + Modulo Function is x^n + 1
def Example02(n, q, g):
    A = [randint(0, q-1) for _ in range(n-1)] + [randint(1, q-1)]
    B = [randint(0, q-1) for _ in range(n-1)] + [randint(1, q-1)]
    f = [1] + [0 for _ in range(n-1)] + [1]        # Cyclic Conv

    print("##### Example 02 (NWC) #####")
    print("[Polynomials]")
    print("A      :", A)
    print("B      :", B)
    print("M      :", f)

    # Polynomial multiplication

    print()
    print("[NTT]")

    start = time.time()
    C = multPolyNaive(A, B, f, q)
    naiveT = time.time() - start
    print("Naive  :", C)

    start = time.time()
    C_pntt = multPolypNTT(A, B, q, n, g)
    pnttT = time.time() - start
    print("C      :", C_pntt)

    print(C_pntt == C, naiveT, pnttT)
    print()

if __name__ == "__main__":
    n = 8                 # Number of Coefficient
    q = 97
    # q = 2**64-2**32+1
    g = generate_primitive_root(q)

    print("#### Parameters ####")
    print("n     :", n)
    print("q     :", q)
    print("g     :", g)
    print()

    Example01(n, q, g)
    Example02(n, q, g)