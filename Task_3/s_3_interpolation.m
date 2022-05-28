function s_3 = s_3_interpolation(xs, ys, X)
  n = numel(xs) - 3;
  h = (xs(end - 1) - xs(2))/n
  B_3 = GetB_(3);
  s_3 = @(t) 0;
  for ii = -1:n+1
    s_3 = @(t) s_3(t) + X(ii+2).*B_3( (t - xs(ii+2))./h);
  endfor
endfunction