from random import randint
import math

def printPoly(P):
    l = len(P)
    print("\t= ", end='')
    for i in range(l):
        print(P[i], end='')
        if i != 0:
            print("x^" + str(i), end='')
        if i != l-1:
            print(" + ", end='')
    print()

def isPrime(x):
    if x<2 : return False
    for i in range(2, int(math.sqrt(x))+1):
        if x%i == 0 : return False
    return True

def gcd(a,b):
    while b != 0:
        a, b = b, a % b
    return a

def generate_primitive_root(q):
    if q == 2**64-2**32+1:
        return 7
    not_approved = []

    for i in range(q):
        if isPrime(i):
            s = set()
            for j in range(q):
                s.add(i**j % q)
            if s == set(range(q))-{0}:
                return i
    return None

def evalPoly(P, x, q):
    v = 1
    res = 0
    for i in P:
        res += (v * i)
        res %= q
        v *= x

    return res

def multPolyNaive(A, B, f, q):
    C = [0]*(len(A)+len(B)-1)
    for i in range(len(A)):
        for j in range(len(B)):
            C[i+j] += A[i]*B[j]
            C[i+j] %= q


    # Polynomial Modulo
    while len(f) <= len(C):
        tmp = [0] * (len(C) - len(f)) + f
        m_num = C[-1]
        for i in range(len(C)):
            C[i] -= (tmp[i] * m_num)
            C[i] %= q
        if C[-1] == 0:
            C = C[:-1]
    return C

def inv(a, m):
    if a == 0:
        return 0
    lm, hm = 1, 0
    low, high = a % m, m
    while low > 1:
        r = high//low
        nm, new = hm-lm*r, high-low*r
        lm, low, hm, high = nm, new, lm, low

    return lm % m

def butterfly_no_bo_8(x, wN, q):
    X = x
    N = len(x)
    trans = 1
    size = N
    w_ord = [0, 2, 1, 3]

    while trans < N:
        size = int(size/2)
        for t in range(0, trans):
            wb = wN**w_ord[t]
            for s in range(0, size):
                a_idx = 2*t*size + s
                b_idx = (2*t+1)*size + s
                tmp_mul = x[b_idx] * wb
                a = x[a_idx] + tmp_mul
                b = x[a_idx] - tmp_mul
                X[a_idx] = a % q
                X[b_idx] = b % q

        trans *= 2

    X_ord = [0, 4, 2, 6, 1, 5, 3, 7]
    X = [X[y] for y in X_ord]
    return X

def ntt_CT_no_bo(x, wN, q):
    if len(x) == 8:
        X = butterfly_no_bo_8(x, wN, q)
    else:
        return None
    return X

def intt_CT_no_bo(x, wN, q):
    X = []
    if len(x) == 8:
        X = butterfly_no_bo_8(x, inv(wN, q), q)
    else:
        return None

    scale = inv(len(x), q)
    for i in range(len(x)):
        X[i] = (X[i]*scale) % q

    return X

def multPolyNTT(A, B, q, n, g):
    k = (q - 1) // n
    # wN = [int(g**(i*k)) % q for i in range(0, n)]
    wN = int(g**k)
    # print("wN     :", wN)
    A_ntt = ntt_CT_no_bo(A, wN,q)
    B_ntt = ntt_CT_no_bo(B, wN, q)
    C_ntt = [(x*y)%q for x, y in zip(A_ntt, B_ntt)]
    C_ntt_intt = intt_CT_no_bo(C_ntt, wN, q)
    return C_ntt_intt

def p_ntt_CT_no_bo(x, wN, q):
    if len(x) != 8:
        return None
    X = x
    N = len(x)
    trans = 1
    size = N
    w_ord = [4, 2, 6, 1, 5, 3, 7]

    wb_idx = 0
    while trans < N:
        size = int(size/2)
        for t in range(0, trans):
            wb = wN**w_ord[wb_idx]
            wb_idx += 1
            for s in range(0, size):
                a_idx = 2*t*size + s
                b_idx = (2*t+1)*size + s
                tmp_mul = x[b_idx] * wb
                a = x[a_idx] + tmp_mul
                b = x[a_idx] - tmp_mul
                X[a_idx] = a % q
                X[b_idx] = b % q

        trans *= 2

    X_ord = [0, 4, 2, 6, 1, 5, 3, 7]
    X = [X[y] for y in X_ord]
    return X

def p_intt_GS_no_bo(x, wN, q):
    if len(x) != 8:
        return None
    X = x
    N = len(x)
    trans = 1
    size = N
    wN = inv(wN, q)
    w_ord = [1, 3, 5, 7, 2, 6, 2, 6, 4, 4, 4, 4]

    wb_idx = 0
    while trans < N:
        size = int(size/2)
        for t in range(0, trans):
            for s in range(0, size):
                wb = wN**w_ord[wb_idx]
                wb_idx += 1
                a_idx = 2*t*size + s
                b_idx = (2*t+1)*size + s
                tmp_mul = x[b_idx] * wb
                a = x[a_idx] + x[b_idx]
                b = x[a_idx] - x[b_idx]
                b = (b * wb) % q
                X[a_idx] = a % q
                X[b_idx] = b % q

        trans *= 2

    X_ord = [0, 4, 2, 6, 1, 5, 3, 7]
    X = [X[y] for y in X_ord]

    scale = inv(len(x), q)
    for i in range(len(x)):
        X[i] = (X[i] * scale) % q


    return X

def multPolypNTT(A, B, q, n, g):
    assert (q - 1) // (2*n) != 0
    k = (q - 1) // (2*n)
    # phi = [int(g**(i*k)) % q for i in range(0, 2*n)]
    phi = int(g**k)
    # print("phi    :", phi)
    A_ntt = p_ntt_CT_no_bo(A, phi,q)
    B_ntt = p_ntt_CT_no_bo(B, phi, q)
    C_ntt = [(x*y)%q for x, y in zip(A_ntt, B_ntt)]
    C_ntt_intt = p_intt_GS_no_bo(C_ntt, phi, q)

    return C_ntt_intt