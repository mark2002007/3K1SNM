clc; close; clear; #clear -classes;
pkg load symbolic;
#
F = @(x) sinc(x/pi);
a = 0;
b = pi/2;
m =  10;
eps = 0.0001;
#
xs = linspace(a, b, m);
ys = [];
for ii = 1:numel(xs)
  ys(ii) = SimpsonInterpolationWithError(F, a, xs(ii), eps);
endfor
plot(xs, ys); hold on; scatter(xs, ys); #fplot(@sinint, [a b]);
[xs;ys]