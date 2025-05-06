% Definição dos dados do problema
A = [10 3 -2; 2 8 -1; 1 1 5];
b = [57; 20; -4];
x0 = [0; 0; 0];
tol = 0.0005;
fprintf("Utilizando matriz da questão 1!\n");

% Verificação do critério de convergência
if abs(A(1,1)) <= abs(A(1,2)) + abs(A(1,3)) || ...
   abs(A(2,2)) <= abs(A(2,1)) + abs(A(2,3)) || ...
   abs(A(3,3)) <= abs(A(3,1)) + abs(A(3,2))
  fprintf("A matriz não é diagonal estritamente dominante por linhas!\n");
end

% Aplicação do método de Jacobi
x = x0;
err = tol + 1;
itr = 0;

fprintf("\nIteração\t   x(1)\t\t   x(2)\t\t   x(3)\t\tErro relativo\n");
while err > tol
  x_ant = x;
  x(1) = (b(1) - A(1,2)*x_ant(2) - A(1,3)*x_ant(3)) / A(1,1);
  x(2) = (b(2) - A(2,1)*x_ant(1) - A(2,3)*x_ant(3)) / A(2,2);
  x(3) = (b(3) - A(3,1)*x_ant(1) - A(3,2)*x_ant(2)) / A(3,3);
  itr = itr + 1;
  err = max(abs((x - x_ant) ./ x));
  fprintf("%5d\t\t%8.5f\t%8.5f\t%8.5f\t%e\n", itr, x(1), x(2), x(3), err);

  if itr > 1000
    disp("O método não converge para a tolerância especificada!");
    break
  end
end

% Impressão final dos resultados
if itr <= 1000
  disp("Valor final das variáveis do sistema:")
  disp(x)
  fprintf("Total de Iterações: %d\n", itr)
  fprintf("Erro relativo final: %e\n", err)
end

