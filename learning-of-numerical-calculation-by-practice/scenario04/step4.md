## 最小2乗法

```
#include <stdio.h>
#include <math.h>

double f (const double x) {
  return log(x)/x;
}

int main() {
  double a, b, h, s, T_ans;
  double T[6][6];
  int m, N, i, k;

  a = 2.0;
  b = 5.0;
  N = 1;
  m = 0;
  h = b-a;
  T[0][0] = h * ( f(a) + f(b) ) / 2.0;
  printf("T[0][0]: %e\n" ,T[0][0]);
  /* 台形則で計算 */
  while (1) {
    N = 2 * N;
    h = h / 2.0;
    s = 0.0;
    for (i=1; i<=N-1; i+=2) {
      s += f( a + (double)i * h );
    }
    T[m+1][0] = T[m][0] / 2.0 + h * s;
    printf("T[%d][0]: %e\n", m+1, T[m+1][0]);
    if (N == 32) break;
    m++;
  }
  /* ロンバーク積分法で計算 */
  for (k=1; k<=5; k++) {
    for (m=k; m<=5; m++) {
      T[m][k] = (pow(4.0,(double)k) * T[m][k-1] - T[m-1][k-1]) / (pow(4.0,(double)k) - 1.0);
      printf("T[%i][%i]: %e\n", m, k, T[m][k]);
    }
  }

  T_ans = 1.0/2.0*(log(b)*log(b)-log(a)*log(a));
  printf("N=32/T: %e, T_ans: %e, Diff: %e\n", T[5][5], T_ans, T[5][5]-T_ans);

  return 0;
}
```{{copy}}

```
gcc -Wall -o program ./romberg01.c -lm
```{{execute}}
