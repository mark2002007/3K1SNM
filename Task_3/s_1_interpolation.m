function s_1 = s_1_interpolation(xs, ys)
  n = numel(xs) - 1;
  h = (xs(end) - xs(1))./n;
  B_1 = GetB_(1);
  s_1 = @(x) 0;
  for ii = 0:n
    s_1 = @(x) s_1(x) + ys(ii+1).*B_1( (x - xs(ii+1))./h);
  endfor
endfunction