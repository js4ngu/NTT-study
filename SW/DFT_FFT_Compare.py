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

def func_test():
    print("FFT/IFF test")
    a_t = np.array([3, 2, 1, 0, 4, 5, 6, 1, 2])
    b_t = np.array([6, 5, 4, 0, 4, 5, 6, 1, 2])

    A_t = DFT(a_t)
    B_t = DFT(b_t)
    C_t = A_t*B_t
    c_n_t = IDFT(C_t).real

    print("A_k = ", A_t)
    print("B_k = ", B_t)
    print("C_k = ", C_t)
    print("C_n = ", c_n_t)

    a_n = np.array([3, 2, 1, 0, 4, 5, 6, 1, 2])
    b_n = np.array([6, 5, 4, 0, 4, 5, 6, 1, 2])

    print("DFT/IDFT test")
    A_k = DFT(a_n)
    B_k = DFT(b_n)
    C_k = A_k*B_k
    c_n = IDFT(C_k).real

    print("A_k = ", A_k)
    print("B_k = ", B_k)
    print("C_k = ", C_k)
    print("C_n = ", c_n)

def FFT(x):
    N = len(x)
    if N <= 1:
        return x
    P = FFT(x[0::2])
    Q = FFT(x[1::2])
    WQ = [np.exp(-2j * np.pi * k / N) * Q[k] for k in range(N // 2)]

    return np.concatenate([P + WQ, P - WQ])

def IFFT(x):
    N = len(x)
    return np.conj(FFT(np.conj(x))) / N


def main():
    func_test()
    
if __name__ == '__main__':
    main()




