## 目標

```
#include <stdio.h>
#include <math.h>

double f (const double x) {
  return log(x);
}

double f_prime (const double x) {
  return 1.0/x;
}

int main() {
  int i;
  double x, x_new, eps;

  x = 2.0;
  eps = 1e-8;
  i = 1;
  while (1) {
    x_new = x - f(x) / f_prime(x);
    printf("%d // x_new: %e x_diff: %e\n", i, x_new, fabs(x_new - x)/fabs(x_new));
    if (fabs(x_new - x) < eps * fabs(x_new)) break;
    x = x_new;
    i++;
  }
  printf("root of log_e(x) is: %e\n", x_new);

  return 0;
}
```{{copy}}
