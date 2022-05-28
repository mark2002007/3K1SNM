function Task_3_1(a, b, n)
  #B-SPLINES
  B_1 = GetB_(1)
  B_2 = GetB_(2)
  #SETUP
  h = (b-a)/n;
  xs = a:h:b;
  xms = linspace(a,b,1000);
  #PLOT
  for k = [0:n]
    subplot(2,1,1); hold on; plot(xms,B_1((@(x)(x-xs(k+1))./h)(xms)));
    subplot(2,1,2); hold on; plot(xms,B_2((@(x)(x-xs(k+1))./h)(xms)))
  endfor
endfunction
