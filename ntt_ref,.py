# 
# Number-theoretic transform library (Python)
# 
# Copyright (c) 2022 Project Nayuki
# All rights reserved. Contact Nayuki for licensing.
# https://www.nayuki.io/page/number-theoretic-transform-integer-dft
# 

import itertools
import numpy as np
from typing import List, Tuple

# Returns the forward number-theoretic transform of the given vector with
# respect to the given primitive nth root of unity under the given modulus.
def transform(invec: List[int], root: int, mod: int) -> List[int]:
	outvec: List[int] = []
	for i in range(len(invec)):
		temp: int = 0
		for (j, val) in enumerate(invec):
			temp += val * pow(root, i * j, mod)
			temp %= mod
		outvec.append(temp)
	return outvec


# Returns the inverse number-theoretic transform of the given vector with
# respect to the given primitive nth root of unity under the given modulus.
def inverse_transform(invec: List[int], root: int, mod: int) -> List[int]:
	outvec: List[int] = transform(invec, pow(root, -1, mod), mod)
	scaler: int = pow(len(invec), -1, mod)
	return [(val * scaler % mod) for val in outvec]


def nttMUL_test():
    a = np.array([3,0,1,2,0,0,0,0])
    b = np.array([0,2,2,3,0,0,0,0])
    p = 17
    w = 15

    a_out = np.array(transform(a, w, p))
    print("A = NTT(a) = ",a_out)
    b_out = np.array(transform(b, w, p))
    print("B = NTT(b) = ",b_out)
    c_out = np.array(a_out * b_out)%p
    print("C = A * B  = ",c_out)

    res = inverse_transform(c_out,w,p)
    print("c = iNTT(c)= ", res)

def NegativeWrappedConv():
    p = 17
    w = 15
    psi = 7
    inv_psi = 5

    a = np.array([3,0,1,2,0,0,0,0])
    b = np.array([0,2,2,3,0,0,0,0])
    psi_vec = np.array([psi**0,psi**1,psi**2,psi**3,psi**4,psi**5,psi**6,psi**7]) % p
    invs_psi_vec = np.array([18,5,8,6,13,14,2,10])

    a_dot = (a * psi_vec)%p
    b_dot = (b * psi_vec)%p

    print("a'=", a_dot)
    print("b'=", b_dot)

    #Clear
    a_out = np.array(transform(a_dot, w, p))
    print("A = NTT(a) = ",a_out)
    b_out = np.array(transform(b_dot, w, p))
    print("B = NTT(b) = ",b_out)
    #Clear

    c_out = np.array(a_out * b_out)
    c_out = c_out
    print("C = A * B  = ",c_out)

    res = inverse_transform(c_out,w,p) * invs_psi_vec
    print("c = iNTT(c)= ", res % p)

def main():
    print("=====NTT MUL=====")
    nttMUL_test()
    print("=====Negative wrapped conv=====")
    NegativeWrappedConv()

main()