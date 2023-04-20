#include <stdio.h>

#define N 8

void naiveNTT();

int main() {
    naiveNTT();
    return 0;
}

void naiveNTT() {
    int mod = 17;
    int root = 9;
    int dataIN[N] = {3, 1, 2, 6, 0, 0, 0, 0};
    int factor;
    int temp;
    int dataOUT[N];

    for (int i = 0; i < N; i++) {
        temp = 0;
        for (int j = 0; j < N; j++) {
            factor = 1;
            // pow
            for (int k = 0; k < i * j; k++) {
                factor = (factor * root) % mod;
            }
            
            temp = (temp + (dataIN[j] * factor)) % mod;
        }
        dataOUT[i] = temp;
    }

    for (int i = 0; i < N; i++)
        printf("%d ", dataOUT[i]);
    printf("\n");
}

//12, 9, 4, 12, 15, 15, 15, 10'
