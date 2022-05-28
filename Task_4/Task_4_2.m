clc;clear;close;
#Task_4_2
A = [1 3; 2 4; 5 6]
b = [1 0 1]'
x = A\b
e = A*x-b
e1 = norm(e, 1)