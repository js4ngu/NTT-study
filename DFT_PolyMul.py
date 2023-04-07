import numpy as np

def DFT(x):
    x = np.asarray(x, dtype=float)
    N = x.shape[0]          #FT할 size
    n = np.arange(N)
    k = n.reshape((N, 1))
    e = np.exp(-2j * np.pi * k * n / N)
    return np.dot(e, x)

def IDFT(X):
    X = np.asarray(X, dtype=np.complex128)
    N = X.shape[0]
    n = np.arange(N)
    k = n.reshape((N, 1))
    e = np.exp(2j * np.pi * k * n / N)
    return np.dot(e, X) / N


def main():
    a_n = np.array([3, 2, 1, 0, 0])
    b_n = np.array([6, 5, 4, 0, 0])

    A_k = DFT(a_n)
    B_k = DFT(b_n)

    print("A_k = ", A_k)
    print("B_k = ", B_k)

    C_k = A_k*B_k
    print("C_k = ", C_k)

    c_n = IDFT(C_k).real

    print("C_n = ", c_n)

main()