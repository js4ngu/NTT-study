import math

def reverse_bits(number, bit_length):
    # Reverses the bits of `number` up to `bit_length`.
    reversed = 0
    for i in range(0, bit_length):
        if (number >> i) & 1: 
            reversed |= 1 << (bit_length - 1 - i)
    return reversed

def cooley_tukey_ntt(out, q, omegas, n):
    # Reverses the bits of `number` up to `bit_length`.
    for i in range(n):
        rev_i = reverse_bits(i, n.bit_length() - 1)
        if rev_i > i:
            out[i] ^= out[rev_i]
            out[rev_i] ^= out[i]
            out[i] ^= out[rev_i]
    iterations = int(math.log2(n))

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


def cooley_tukey_intt(out, q, omegas, n, invN):
    out = cooley_tukey_ntt(out, q, omegas, n)
    # Scale output by 1/n
    for i in range(n):
        out[i] = (out[i] * invN) % q

    return out

def demo():
    a = [0,1,2,3,4,5,6,7]
    mod = 29
    w = [1, 16, 24, 7, 25, 23, 20, 1]
    A = cooley_tukey_ntt(a,mod,w, 8)
    print("==NTT Result==")
    print(A)

    invW = [1, 2, 4, 8, 16, 15, 13, 9]
    invN = 15
    B = cooley_tukey_intt(A, mod, invW, 8, invN)

    print("==INTT Result==")
    print(B)

def main():
    demo()

if __name__ == '__main__':
    main()