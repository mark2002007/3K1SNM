function Task_3_2 (f_str, a = -1, b = 1, n = 10, m = 10000)
  f = str2func(['@(x)', f_str]);
  syms x;
  F = sym(f_str);
  #=====B_1 INTERPOLATION=====
  #SETUP
  h = (b - a)/n;
  xs = a:h:b;
  ys = f(xs);
  #COMPUTATION
  s_1 = s_1_interpolation(xs, ys);
  #=====B_3 INTERPOLATION=====
  #SETUP
  h = (b-a)/n;
  xs = a-h:h:b+h;
  ys = f(xs);
  #COMPUTATIONS
  #build matrix A and vector B
  A = zeros(n+3, n+3);
  A(1,1) = A(end, end - 2) = -1/2; A(1,3) = A(end, end) = 1/2;
  B(1,1) = h*double(subs(diff(F), x, a));
  for ii = 0:n
    A(ii+2,ii+1) = A(ii+2,ii+3) = 1/6; A(ii+2,ii+2) = 2/3;
    B(ii+2,1) = ys(ii+2);
  endfor
  B(end + 1,1) = h*double(subs(diff(F), x, b));
  #Reduce the matrix to tridiagonal
  coef = A(1,3)/A(2,3);
  A(1,:) = A(1,:) - coef.*A(2,:);
  A(end,:) = A(end,:) + coef.*A(end-1,:);
  B(1) = B(1) - coef.*B(2);
  B(end) = B(end) + coef.*B(end-1);
  #Solve A*X = B
  X = LeftRunMethod(A,B);
  #Compute final sum
  s_3 = s_3_interpolation(xs, ys, X);
  #=====PLOT=====
  xms = linspace(a,b,m);
  subplot(2,2,1); plot(xms, f(xms), xms, s_1(xms));
  subplot(2,2,2); plot(xms, f(xms), xms, s_3(xms));
  subplot(2,2,[3, 4]); plot(xms, f(xms), xms, s_1(xms), xms, s_3(xms));
endfunction