function [xs, ys] = GetDotsF(f, a, b, n)
  xs = linspace(a, b, n);
  ys = f(xs);
endfunction