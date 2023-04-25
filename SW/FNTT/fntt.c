#include <stdio.h>
#include <math.h>

int reverse_bits(int number, int bit_length) {
    int reversed = 0;
    for (int i = 0; i < bit_length; i++) {
        if ((number >> i) & 1) {
            reversed |= 1 << (bit_length - 1 - i);
        }
    }
    return reversed;
}

int* cooley_tukey_ntt(int* out, int q, int* omegas, int n) {
    for (int i = 0; i < n; i++) {
        int rev_i = reverse_bits(i, (int)log2(n));
        if (rev_i > i) {
            out[i] ^= out[rev_i];
            out[rev_i] ^= out[i];
            out[i] ^= out[rev_i];
        }
    }

    int iterations = (int)log2(n);
    int M = 2;

    for (int i = 0; i < iterations; i++) {
        for (int j = 0; j < n; j += M) {
            int g = 0;
            for (int k = j; k < j + M/2; k++) {
                int U = out[k];
                int V = out[k + M/2] * omegas[g];
                out[k] = (U + V) % q;
                out[k + M/2] = (U - V + q) % q;
                g = (g + n / M) % n;
            }
        }
        M <<= 1;
    }

    return out;
}

int* cooley_tukey_intt(int* out, int q, int* omegas, int n, int invN) {
    out = cooley_tukey_ntt(out, q, omegas, n);

    // Scale output by 1/n
    for (int i = 0; i < n; i++) {
        out[i] = (out[i] * invN) % q;
    }

    return out;
}

void main() {
    int a[] = {1, 2, 3, 0, 0, 0, 0, 0};
    int mod = 17;
    int w[] = {1, 9, 13, 15, 16, 8, 4, 2};
    int n = 8;

    int* A = cooley_tukey_ntt(a, mod, w, n);
    printf("=====\n");
    for (int i = 0; i < n; i++) 
        printf("%d, ", A[i]);
    printf("\n");


    int invW[] = {1, 2, 4, 8, 16, 15, 13, 9};
    int invN = 15;

    int* B = cooley_tukey_intt(A, mod, invW, n, invN);

    for (int i = 0; i < n; i++) 
        printf("%d, ", B[i]);
    printf("\n");
}
