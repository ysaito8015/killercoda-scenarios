## 最小2乗法

```
#include <stdio.h>
#include <math.h>

int sm = 3;
int sn = 5;

double f (const double x) {
  return pow(x,sm)*pow(1-x,sn);
}

double fact (const int n) {
  int i;
  int ret=1;
  for (i=2; i<=n; i++) ret *= i;
  return (double)ret;
}

int main() {
  double a, b, h, ss, eps;
  double T, T_new, S, S_new, S_ans;
  int N, i;

  a = 0.0;
  b = 1.0;
  eps = 1.0e-6;
  N = 2;
  h = (b-a)/2.0;
  T = h * ( f(a) + 2.0 * f( (a+b)/2.0 ) + f(b) ) / 2.0;
  S = h * ( f(a) + 4.0 * f( (a+b)/2.0 ) + f(b) ) / 3.0;
  while (1) {
    N = 2 * N;
    h = h / 2.0;
    ss = 0.0;
    for (i=1; i<=N-1; i+=2) {
      ss += f( a + (double)i * h );
    }
    T_new = T / 2.0 + h * ss;
    S_new = (4.0 * T_new - T ) / 3.0;
    if (fabs(S_new-S) < (eps * fabs(S_new))) break;
	printf("N: %d, S: %e, abs(S_new-S): %e, eps*abs(S_new): %e\n",
		   N, S, fabs(S_new-S), eps*fabs(S_new));
    T = T_new;
    S = S_new;
  }

  S_ans = fact(sm)*fact(sn) / fact(sm+sn+1);
  printf("S_new: %e, S_ans: %e, Diff: %e\n", S, S_ans, S-S_ans);

  return 0;
}
```{{copy}}

```
gcc -Wall -o program ./simpson02.c -lm
```{{execute}}
