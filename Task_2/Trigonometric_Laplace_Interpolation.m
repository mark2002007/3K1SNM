function q = Trigonometric_Laplace_Interpolation(xs, ys)
  format long
  if(mod(numel(xs),2))
    n = (numel(xs)-1)/2
    a =  2/(2*n+1)*sum((@(k, j) ys(j+1).*cos((2 .*pi.*k.*j)./(2 .*n+1)))([0:n]', [0:2*n]), 2)
    b =  2/(2*n+1)*sum((@(k, j) ys(j+1).*sin((2 .*pi.*k.*j)./(2 .*n+1)))([1:n]', [0:2*n]), 2)
    q = @(t) a(1)./2 + sum((@(k) a(k+1).*cos(k.*t) + b(k).*sin(k.*t))([1:n]'))
  else
    n = numel(xs)/2
    a =  1/n*sum((@(k, j) ys(j+1).*cos((pi.*k.*j)./n))([0:n]', [0:2*n-1]), 2)
    b =  1/n*sum((@(k, j) ys(j+1).*sin((pi.*k.*j)./n))([1:n]', [0:2*n-1]), 2)
    q = @(t) a(1)./2 + sum((@(k) a(k+1).*cos(k.*t) + b(k).*sin(k.*t))([1:n-1]')) + a(end)./2 .*cos(n.*t)
  endif
  endfunction