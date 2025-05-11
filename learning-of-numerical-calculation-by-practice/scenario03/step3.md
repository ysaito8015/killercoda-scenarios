## スプライン補完
### C

```
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define N 11

double f_sin (const double x) {
  return 2.0*sin(x);
}

double f_pow2 (const double x) {
  return x*x;
}

void MyLUsolve (int n, double A[n][n], const double b[n], double u[n]) {
  double c[n];
  int i, j, k;
  double dtemp;

  /* LU分解 */
  for (k=0; k<n-1; k++) {
    dtemp = 1.0 / A[k][k];
    for (i=k+1; i<n; i++) {
      A[i][k] = A[i][k]*dtemp;
    }
    for (j=k+1; j<n; j++) {
      dtemp = A[j][k];
      for (i=k+1; i<n; i++) {
      A[j][i] = A[j][i] - A[k][i]*dtemp;
      }
    }
  }

  /* 前進代入 */
  for (k=0; k<n; k++) {
    c[k] = b[k];
    for (j=0; j<k; j++) {
      c[k] -= A[k][j]*c[j];
    }
  }

  /* 後退代入 */
  u[n-1] = c[n-1]/A[n-1][n-1];
  for (k=n-2; k>=0; k--) {
    u[k] = c[k];
    for (j=k+1; j<n; j++) {
      u[k] -= A[k][j]*u[j];
    }
    u[k] = u[k] / A[k][k];
  }
}

int main() {
  double A[N-1][N-1], b[N], u[N+1], h_j[N];
  double x_j[N+2], y_j[N+2];
  double x, y, aj, bj, cj, dj;
  int i, j;

  /* サンプルデータ */
  x_j[0]  = 0.0;
  x_j[1]  = 0.375;
  x_j[2]  = 0.75;
  x_j[3]  = 1.125;
  x_j[4]  = 1.5;
  x_j[5]  = 1.875;
  x_j[6]  = 2.25;
  x_j[7]  = 2.625;
  x_j[8]  = 3.0;
  x_j[9]  = 3.375;
  x_j[10] = 3.75;
  x_j[11] = 4.125;
  printf("Starts Calculation\n");
  for (i=0; i<N+1; i++) {
    if (i < 5) {
      y_j[i] = f_pow2(x_j[i]);
    } else {
      y_j[i] = f_sin(x_j[i]);
    }
    printf("%d : (x_j[%d], y_j[%d]) (%e, %e)\n", i, i, i, x_j[i], y_j[i]);
  }
  printf("End Calculation\n");
  for (i=0; i<N+1; i++) {
    u[i] = 0.0;
  }

  /* Aとbの係数を作る */
  for (j=0; j<N; j++) {
    h_j[j] =
      x_j[j+1] - x_j[j];
  }
  for (j=1; j<N; j++) {
    b[j] =
      6.0*((y_j[j+1]-y_j[j])/h_j[j] - (y_j[j]-y_j[j-1])/h_j[j-1]);
  }
  for (i=0; i<N-1; i++) {
    for (j=0; j<N-1; j++) {
      A[i][j] = 0.0;
    }
  }
  for (i=0; i<N-1; i++) {
    A[i][i] = 2.0*(h_j[i]+h_j[i+1]);
  }
  for (i=0; i<N-2; i++) {
    A[i][i+1] = h_j[i+1];
  }
  for (i=1; i<N-1; i++) {
    A[i][i-1] = h_j[i];
  }

  /* 連立一次方程式を解く */
  MyLUsolve(N-1, A, &b[1], u);

  /* 補間の実行 */
  printf("Starts Lagrange interpolation\n");
  j = 0;
  for (i=0; i<100; i++) {
    x = 0.0 + (4.125 / 99.0) * (double)i;
    if (x > x_j[j+1]) j++;
    /* 係数の計算 */
    aj = (u[j+1]-u[j])/ (6.0*(x_j[j+1]-x_j[j]));
    bj = u[j] / 2.0;
    cj = (y_j[j+1]-y_j[j])/(x_j[j+1]-x_j[j]) - (x_j[j+1]-x_j[j])*(2.0*u[j]+u[j+1])/6.0;
    dj = y_j[j];
    /* 三次元スプラインによる近似 */
    y = aj*(x-x_j[j])*(x-x_j[j])*(x-x_j[j]) + bj*(x-x_j[j])*(x-x_j[j]) + cj*(x-x_j[j]) + dj;
    printf("x,y : %e, %e\n", x, y);
  }
  printf("Ends Lagrange interpolation\n");

  return 0;
}
```{{copy}}

```
gcc -Wall -o program ./spline.c -lm
```{{execute}}

### Fortran

```
module procedures
contains
  real(kind=8) function f_sin(x)
    implicit none
    real(kind=8),intent(in) :: x
    f_sin = 2.0*sin(x)
  end function f_sin

  real(kind=8) function f_pow2(x)
    implicit none
    real(kind=8),intent(in) :: x
    f_pow2 = x*x
  end function f_pow2

  subroutine MyLUsolve(n, A, b, u)
    implicit none
    real(kind=8),dimension(:,:),intent(inout) :: A
    real(kind=8),dimension(:),intent(in)      :: b
    real(kind=8),dimension(:),intent(inout)   :: u
    real(kind=8),dimension(n)                 :: c
    integer,intent(in)                        :: n
    integer                                   :: i, j, k
    real(kind=8)                              :: dtemp

    ! LU分解
    do k=1, n-1
       dtemp = 1.0d0 / A(k,k)
       do i=k+1, n
          A(i,k) = A(i,k)*dtemp
       end do
       do j=k+1, n
          dtemp = A(j,k)
          do i=k+1, n
             A(j,i) = A(j,i) - A(k,i)*dtemp
          end do
       end do
    end do

    ! 前進代入
    do k=1, n
       c(k) = b(k)
       do j=1, k-1
          c(k) = c(k) - A(k,j)*c(j)
       end do
    end do

    ! 後退代入
    u(n) = c(n)/A(n,n)
    do k=n-1, 1, -1
       u(k) = c(k)
       do j=k+1, n
          u(k) = u(k) - A(k,j)*u(j)
       end do
       u(k) = u(k) / A(k,k)
    end do
  end subroutine MyLUsolve
end module procedures

program main
  use procedures
  implicit none
  integer, parameter              :: N = 11
  real(kind=8),dimension(N-1,N-1) :: A
  real(kind=8),dimension(N)       :: b, h_j
  real(kind=8),dimension(N+1)     :: u
  real(kind=8),dimension(N+2)     :: x_j, y_j
  real(kind=8)                    :: x, y, aj, bj, cj, dj
  integer                         :: i, j

  ! サンプルデータ
  x_j(1)  = 0.0
  x_j(2)  = 0.375
  x_j(3)  = 0.75
  x_j(4)  = 1.125
  x_j(5)  = 1.5
  x_j(6)  = 1.875
  x_j(7)  = 2.25
  x_j(8)  = 2.625
  x_j(9)  = 3.0
  x_j(10) = 3.375
  x_j(11) = 3.75
  x_j(12) = 4.125
  do i=1, N+1
     if (i < 6) then
        y_j(i) = f_pow2(x_j(i))
     else
        y_j(i) = f_sin(x_j(i))
     end if
     write(*,fmt='(i0,a,e14.7,1x,e14.7)') i, " : ", x_j(i), y_j(i)
  end do
  do i=1, N+1
     u(i) = 0.0d0
  end do

  ! Aとbの係数を作る
  do j=1, N
     h_j(j) = x_j(j+1) - x_j(j)
  end do
  do j=2, N
     b(j) = 6.0d0*((y_j(j+1)-y_j(j))/h_j(j) - (y_j(j)-y_j(j-1))/h_j(j-1))
  end do
  do i=1, N-1
     do j=1, N-1
        A(i,j) = 0.0
     end do
  end do
  do i=1, N-1
     A(i,i) = 2.0*(h_j(i)+h_j(i+1))
  end do
  do i=1, N-2
     A(i,i+1) = h_j(i+1)
  end do
  do i=2, N-1
     A(i,i-1) = h_j(i)
  end do

  ! 連立一次方程式を解く
  call MyLUsolve(N-1, A, b(2:N), u)

  ! 補間の実行
  j = 1
  do i=1, 100
     x = 0.0d0 + (4.125d0 / 99.0d0) * dble(i-1)
     if (x > x_j(j+1)) j = j + 1
     ! 係数の計算
     aj = (u(j+1)-u(j))/ (6*(x_j(j+1)-x_j(j)))
     bj = u(j) / 2.0d0
     cj = (y_j(j+1)-y_j(j))/(x_j(j+1)-x_j(j)) - (x_j(j+1)-x_j(j))*(2.0d0*u(j)+u(j+1))/6.0d0
     dj = y_j(j)
     ! 三次元スプラインによる近似
     y = aj*(x-x_j(j))*(x-x_j(j))*(x-x_j(j)) + bj*(x-x_j(j))*(x-x_j(j)) + cj*(x-x_j(j)) + dj
     write(*,fmt='(e14.7,1x,e14.7)') x,y
  end do

  stop
end program main
```{{copy}}


```
gfortran -o program ./spline.f90
```{{execute}}
