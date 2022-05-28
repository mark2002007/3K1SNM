function p = Laplace_Interpolation(xs, ys)
  p = @(x)0;
  for i = 1:numel(xs)
    l = @(x)1;
    for k = 1:numel(xs)
      if k~=i
        l = @(x) l(x).*(x-xs(k))./(xs(i)-xs(k));
      endif
    endfor
    p = @(x) p(x) + ys(i) .* l(x);
  endfor
  endfunction