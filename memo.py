def ntt(a,psi,prime):
    n = len(a)
#    print("length N = ", n)
    t = n
    m = 1
    while m < n:
        m = 2 * m
        t = t // 2

        for i in range (0,m,1):
            j1 = 2 * i * t
            j2 = j1 + t - 1
            s = psi[m+i]

            for j in range(j1, j2, 1):
                U = a[j]
                V = a[j+t]*s
 #               print("U = ",U)
 #               print("V = ",V)
                a[j] = (U+V)%prime
                a[j+t] = (U-V)%prime
                return a

def main():
    a = [0,1,2,3]
    prime = 5

    psi = [1,2,4,3,1,2,4,3]
    print("psi = ", psi)
    print(ntt(a,psi,prime))

    psi_rev = [3,4,2,1,3,4,2,1]
    print("psi_rev = ", psi_rev)
    print(ntt(a,psi_rev,prime))
main()