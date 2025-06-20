% Método de Euler para resolver EDOs de 1ª ordem

function [x, y] = metodo_euler(f, a, b, n, y0)
  % f  : função f(x, y) da EDO
  % a  : valor inicial de x
  % b  : valor final de x
  % n  : número de passos
  % y0 : valor inicial de y

  h = (b - a) / n;
  x = zeros(1, n+1);  % vetor de x
  y = zeros(1, n+1);  % vetor de y

  x(1) = a;
  y(1) = y0;

  for i = 1:n
    y(i+1) = y(i) + h * f(x(i), y(i));
    x(i+1) = x(i) + h;
  endfor
endfunction
