function res = SimpsonInterpolation(f, a, b, n)
  if(a == b)
    res = 0;
  else
    h = (b-a)/n;
    xs = a:h:b;
    res = h/3*(1/2*f(xs(1)) + sum(f(xs(2:n))) + 2*sum(f((xs(1:n) + xs(2:n+1))/2)) + 1/2*f(xs(n+1)));
  endif
endfunction