#==============================
#==========USER INPUT==========
clc
f = str2func(strcat('@(x)',input('Enter function : ', 's')));
fprintf('[a, b]\n');
a = input("Enter a : ");
b = input("Enter b : ");
n = input("Enter n : ");
m = -1;
while m <= n+1
    m = input("Enter m (> n + 1) : ");
  endwhile
x = input("Enter x : ");
#{
f = @abs;
a = -1;
b = 1;
n = 3;
m = 30;
x = 1/2;
#}
#==========NODE TYPE==========
# Equidistant Nodes
  xse = linspace(a, b, n);
  yse = f(xse);
# Chebyshevs' Nodes 
  xsc = @(k) (a+b)./2 + (b-a)./2 .* cos((2 .* k+1)./(2 .* n).*pi)
  xsc = xsc(0:n-1)
  ysc = f(xsc)
#==========METHOD==========
ple = Laplace_Interpolation(xse, yse);
pne = Newton_Interpolation(xse, yse);
plc = Laplace_Interpolation(xsc, ysc);
pnc = Newton_Interpolation(xsc, ysc);
#==========OUTPUT==========
clc
fprintf('Equidistant Nodes : ')
fprintf('Laplace : \n');
fprintf('p(x) = %f\n', ple(x));
fprintf('|p(x) - f(x)| = %f\n', abs(ple(x) - f(x)));

fprintf('\nNewton : \n');
fprintf('p(x) = %f\n', pne(x));
fprintf('|p(x) - f(x)| = %f\n', abs(pne(x) - f(x)));

fprintf('Chebyshevs Nodes : ')
fprintf('Laplace : \n');
fprintf('p(x) = %f\n', plc(x));
fprintf('|p(x) - f(x)| = %f\n', abs(plc(x) - f(x)));

fprintf('\nNewton : \n');
fprintf('p(x) = %f\n', pnc(x));
fprintf('|p(x) - f(x)| = %f\n', abs(pnc(x) - f(x)));

xms = linspace(a,b,m);
#{ 
Siplified Plot
subplot(2,2,1); plot(xms, f(xms)); hold on; plot(xms, ple(xms)); hold off; title('Equidistant + Laplace');
subplot(2,2,2); plot(xms, f(xms)); hold on; plot(xms, pne(xms)); hold off; title('Equidistant + Newton');
subplot(2,2,3); plot(xms, f(xms)); hold on; plot(xms, plc(xms)); hold off; title('Chebyshevs'' + Laplace');
subplot(2,2,4); plot(xms, f(xms)); hold on; plot(xms, pnc(xms)); hold off; title('Chebyshevs'' + Newton');
#}

subplot(2,3,1); plot(xms, f(xms)); hold on; plot(xms, ple(xms)); hold off; title('Equidistant + Laplace'); grid on;
subplot(2,3,2); plot(xms, f(xms)); hold on; plot(xms, pne(xms)); hold off; title('Equidistant + Newton'); grid on;
subplot(2,3,3); plot(xms, f(xms)); hold on; plot(xms, ple(xms)); plot(xms, pne(xms)); hold off; title('Equidistant + Laplace + Newton'); grid on;
subplot(2,3,4); plot(xms, f(xms)); hold on; plot(xms, plc(xms)); hold off; title('Chebyshevs'' + Laplace'); grid on;
subplot(2,3,5); plot(xms, f(xms)); hold on; plot(xms, pnc(xms)); hold off; title('Chebyshevs'' + Newton'); grid on;
subplot(2,3,6); plot(xms, f(xms)); hold on; plot(xms, plc(xms)); plot(xms, pnc(xms)); hold off; title('Chebyshevs'' + Laplace + Newton'); grid on;