## 台形則

```
#include <stdio.h>
#include <math.h>

double f (const double x) {
  return log(x)/x;
}

int main() {
  double a, b, h, s, T, T_new, T_ans, eps;
  int N, i;

  a = 2.0;
  b = 5.0;
  eps = 1.0e-6;
  N = 1;
  h = b - a;
  T = h * ( f(a) + f(b) ) / 2.0;
  while (1) {
    N = 2 * N;
    h = h / 2.0;
    s = 0.0;
    for (i=1; i<=N-1; i+=2) {
      s += f( a + (double)i * h );
    }
    T_new = T / 2.0 + h * s;
    if (fabs(T_new-T) < eps*fabs(T_new)) break;
    printf("N: %d, T_new: %e, abs(T_new-T): %e, eps*abs(T_new): %e\n",
		   N, T_new, fabs(T_new-T),eps * fabs(T_new));
    T = T_new;
  }

  T_ans = 1.0/2.0*(log(b)*log(b)-log(a)*log(a));
  printf("T_new: %e, T_ans:%e, Diff:%e\n", T_new, T_ans, T_new-T_ans);

  return 0;
}
```{{copy}}

```
gcc -Wall -o program ./trapezoid.c -lm
```{{execute}}
