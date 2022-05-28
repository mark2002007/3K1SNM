function p = Newton_Interpolation(xs, ys)
  for i = 1:numel(xs)
    D(i,1) = ys(i)
  endfor
  
  for k = 2:numel(xs)
    for j = 1:numel(xs) - k + 1
      D(j,k) = (D(j+1,k-1)-D(j,k-1))./(xs(j+k-1)-xs(j));
    endfor
  endfor
  p = @(x)0
  for k = 1:numel(xs)
    l = @(x)1
    for i = 1:k-1
      l = @(x) l(x).*(x - xs(i))
    endfor
    p = @(x) p(x) + D(1,k).*l(x)
  endfor
  endfunction