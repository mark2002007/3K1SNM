
#==============================
#==========USER INPUT==========
clc
clear
f = str2func(strcat('@(x)',input('Enter function : ', 's')));
fprintf('[0, 2*pi)\n');
n = input("Enter n : ");
m = -1;
while m <= n+1
    m = input("Enter m (> n + 1) : ");
  endwhile
x = input("Enter x : ");
#==========NODE TYPE==========
# Equidistant Nodes
if(mod(n,2))
  xse = (2.*pi.*[0:n-1])./n;
else
  xse = (pi.*[0:n-1])./(n/2);
endif
yse = f(xse);

#==========METHOD==========
qle = Trigonometric_Laplace_Interpolation(xse, yse);
#==========OUTPUT==========

clc
fprintf('Equidistant Nodes : \n');
fprintf('Trigonometric Laplace : \n');
fprintf('q(x) = %f\n', qle(x));
fprintf('|q(x) - f(x)| = %f\n', abs(qle(x) - f(x)));

if(mod(n,2))
  xms = (2.*pi.*[0:m-1])./m;
else
  xms = (pi.*[0:m-1])./(m/2);
endif

subplot(1,3,1); plot(xms, f(xms)); legend('f(x)','FontSize',16); axis square
subplot(1,3,2); plot(xms, qle(xms), 'color', 	[0.8500, 0.3250, 0.0980]); legend('q(x)','FontSize',16); axis square
subplot(1,3,3); plot(xms, f(xms), xms, qle(xms)); legend({'f(x)','q(x)'},'FontSize',16); axis square