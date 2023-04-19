#include <stdio.h>

#define N 8

void naiveNTT();

int main() {
    naiveNTT();
    return 0;
}

void naiveNTT() {
    int mod = 17;
    int root = 15;
    int dataIN[N] = {3, 0, 1, 2, 0, 0, 0, 0};
    int factor;
    int temp;
    int dataOUT[N];

    for (int i = 0; i < N; i++) {
        temp = 0;
        for (int j = 0; j < N; j++) {
            factor = 1;
            for (int k = 0; k < i * j; k++) {
                factor = (factor * root) % mod;
            }
            temp = (temp + (dataIN[j] * factor)) % mod;
        }
        dataOUT[i] = temp;
    }

    printf("6 8 11 12 2 6 10 3\n");
    for (int i = 0; i < N; i++)
        printf("%d ", dataOUT[i]);
    printf("\n");
}
