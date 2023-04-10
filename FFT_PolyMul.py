import numpy as np

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

def poly_multiply(a, b):
    # pad the input polynomials to the next power of 2
    n = len(a) + len(b) - 1
    n2 = 2 ** int(np.ceil(np.log2(n)))
    a_pad = np.pad(a, (0, n2 - len(a)))
    b_pad = np.pad(b, (0, n2 - len(b)))

    A = FFT(a_pad)
    B = FFT(b_pad)
    C = A * B
    c = IFFT(C).real

    return c[:n]

def Poly_mul_demo():
    print("Poly Mul by FFT")
    a = np.array([1, 2, 3])
    b = np.array([4, 5, 6])
    c = poly_multiply(a, b)
    print("IFFT(a*b) = ",c)

def main():
    Poly_mul_demo()
    
if __name__ == '__main__':
    main()