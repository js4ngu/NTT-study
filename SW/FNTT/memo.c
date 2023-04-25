int reverse_bits(int data_in, int bit_length) {
    int reversed = 0;
    for (int i = 0; i < bit_length; i++) {
        if ((data_in >> i) & 1) {
            reversed |= 1 << (bit_length - 1 - i);
        }
    }
    return reversed;
}

int* rrr(int* out, int n){
    for (int i = 0; i < n; i++) {
        int rev_i = reverse_bits(i, (int)log2(n));
        if (rev_i > i) {
            out[i] ^= out[rev_i];
            out[rev_i] ^= out[i];
            out[i] ^= out[rev_i];
        }
    }
    return out;
}