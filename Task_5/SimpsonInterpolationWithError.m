function Q1 = SimpsonInterpolationWithError(f, a, b, eps)
    n = 1;
    Q1 = SimpsonInterpolation(f, a, b, n);
    Q2 = 0;
    while(abs(Q2 - Q1) > eps)
      Q2 = Q1;
      n += 1;
      Q1 = SimpsonInterpolation(f, a, b, n);
    endwhile
endfunction