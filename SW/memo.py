import math

def reverse_bits(number, bit_length):
    # Reverses the bits of `number` up to `bit_length`.
    reversed = 0
    for i in range(0, bit_length):
        if (number >> i) & 1: 
            reversed |= 1 << (bit_length - 1 - i)
    return reversed

def cooley_tukey_ntt(a, q, omegas):
    # Radix-2 decimation-in-time FFT.
    n = len(a)
    out = a

    for i in range(n):
        rev_i = reverse_bits(i, n.bit_length() - 1)
        if rev_i > i:
            out[i] ^= out[rev_i]
            out[rev_i] ^= out[i]
            out[i] ^= out[rev_i]

    log2n = math.log2(n)
    # The length of the input array `a` should be a power of 2.
    assert log2n.is_integer()
    
    iterations = int(log2n)
    M = 2
    for _ in range(iterations):
        for i in range(0, n, M):
            g = 0
            for j in range(0, M >> 1):
                k = i + j + (M >> 1)
                U = out[i + j]
                V = out[k] * omegas[g]
                out[i + j] = (U + V) % q
                out[k] = (U - V) % q
                g = g + n // M
        M <<= 1

    return out


def demo():
    a = [1,2,3,0,0,0,0,0]
    mod = 17
    w = [1, 9, 13, 15, 16, 8, 4, 2]
    A = cooley_tukey_ntt(a,mod,w)
    print("=====")
    print("mod, w, a : ",mod ,w, a)
    print(A)
    print("[6, 7, 7, 9, 2, 5, 6, 0]")

def main():
    demo()
    
if __name__ == '__main__':
    main()