function I = simpson38_simples(f, a, b)
  % Calcula o tamanho do passo (3 subintervalos)
  h = (b - a) / 3;

  % Define os pontos intermediários
  x = a + h * (1:2);

  % Aplica a regra de Simpson 3/8 simples
  I = (3 * h) / 8 * (f(a) + 3 * f(x(1)) + 3 * f(x(2)) + f(b));
endfunction

