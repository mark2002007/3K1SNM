function y = LeftRunMethod(A, b)
  n = numel(b);
  khi(n) = - A(n, n - 1)/A(n, n);
  eta(n) = b(n)/A(n, n);
  for ii = n - 1:-1:2
        khi(ii) = -A(ii, ii - 1)/(A(ii,ii) + A(ii,ii+1)*khi(ii+1));
        eta(ii) = (b(ii) - A(ii, ii+1)*eta(ii+1))/(A(ii, ii) + A(ii, ii+1)*khi(ii+1));
  endfor
  y(1) = (b(1) - A(1,2) * eta(2))/(A(1,1) + A(1,2) * khi(2));
  for ii = 2:n
    y(ii) = khi(ii) * y(ii-1) + eta(ii);
  endfor
  endfunction