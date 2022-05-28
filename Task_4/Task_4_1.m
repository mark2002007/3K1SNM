clc;clear;close;
pkg load symbolic
#Task_4_1
n = 2;
[xs, ys] = GetDots(3);
A = arrayfun(@(el) sum(xs.^el), [0:n]+[0:n]');
b = arrayfun(@(el) dot(ys, xs.^el), [0:n]');
x = A\b
ezplot(poly2sym(flip(x))); hold on; scatter(xs, ys); hold off;