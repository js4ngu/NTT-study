# Simple NTT polynomail multiplyer
### Conditon
* p = 17
* w = 15
* psi = 7
* inv_psi = 5  

* $a(x) = 3x^3 + x + 2$
* $b(x) = 2x^2 + 2x + 3$
* $a \times b = 6x^5 + 6x^4 + 11x^3 + 6x^2 + 7x + 6$
---

```python
    p = 17
    w = 15
    psi = 7
    inv_psi = 5

    a = np.array([3,0,1,2,0,0,0,0])
    b = np.array([0,2,2,3,0,0,0,0])
    psi_vec = np.array([psi**0,psi**1,psi**2,psi**3,psi**4,psi**5,psi**6,psi**7]) % p
    invs_psi_vec = np.array([18,5,8,6,13,14,2,10])

    a_dot = (a * psi_vec)%p
    b_dot = (b * psi_vec)%p

    print("a'=", a_dot)
    print("b'=", b_dot)

    #Clear
    a_out = np.array(transform(a_dot, w, p))
    print("A = NTT(a) = ",a_out)
    b_out = np.array(transform(b_dot, w, p))
    print("B = NTT(b) = ",b_out)
    #Clear

    c_out = np.array(a_out * b_out)
    c_out = c_out
    print("C = A * B  = ",c_out)

    res = inverse_transform(c_out,w,p) * invs_psi_vec
    res = res % p
    print("c = iNTT(c)= ", res)
```