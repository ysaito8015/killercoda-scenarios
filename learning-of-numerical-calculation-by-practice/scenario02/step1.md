## 実行環境

killercoda 環境: `ubuntu`

このコースは以下の環境で実行されています.

`pwd; whoami; cat /etc/lsb-release`{{execute}}

コード片をクリックすると右のターミナルでコマンドが実行されます

画面右にあるターミナルで, vim, tig, gfortran, gcc のインストール準備が進行しています.


## マシンイプシロンの設定

作業ディレクトリに移動し

`cd /root/work`{{execute}}

(下記のコード片は, 末尾のアイコンをクリックするとクリップボードにコピーされます)


```c
#include <stdio.h>

int main() {
	float feps;
	feps = 1.0f;
	while ( feps + 1.0f > 1.0f ) {
		feps = feps * 0.5f;
	}

	printf("float machine epsilon hat = %e\n", feps);
	return 0;
}
``` {{copy}}

```c
#include <stdio.h>
#include <math.h>

double machine_epsilon() {
	double eps;
	feps = 1.0f;
	while ( eps + 1.0f > 1.0f ) {
		eps = eps * 0.5f;
	}

	printf("float machine epsilon hat = %e\n", eps);
    return eps;
}

double f (const double x) {
  return log(x);
}

int main() {
  double a, b, c, fc;
  double EPS;
  EPS = machine_epsilon();
  int i;

  a = 0.5;
  b = 2.0;
  i = 1;

  while (1) {
    c = (a + b) / 2;
    printf("%d // a: %e / b: %e / c: %e\n", i, a, b, c);
    printf("  diff: %e\n", fabs(a-b)/2.0);
    if (|a - b| / 2 < EPS) break;
    fc = f(c);
    printf("  fc: %e\n", fc);
    if (fc > 0.0) b = c;
    if (0.0 < fc) a = c;
    if (fc == 0.0) break;
    i++;
  }
  printf("root of log_e(x) is: %e\n", c);

  return 0;
}

``` {{copy}}

