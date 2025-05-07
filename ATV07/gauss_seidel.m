% Método de Gauss-Seidel com verificação de critérios de convergência

% Definição dos dados do problema
A = [10 3 -2; 2 8 -1; 1 1 5];
b = [57; 20; -4];
x0 = [0; 0; 0];
tol = 0.0005;
fprintf("Matriz da questão 1 (Gauss-Seidel)\n");

% =========================
% Critério da diagonal dominante
% =========================
dominante = true;
for i = 1:size(A,1)
    soma = sum(abs(A(i,:))) - abs(A(i,i));
    if abs(A(i,i)) <= soma
        dominante = false;
        break;
    end
end

if dominante
    fprintf("A matriz é diagonal estritamente dominante por linhas.\n");
else
    fprintf("A matriz NÃO é diagonal estritamente dominante por linhas.\n");
end

% =========================
% Critério de Sassenfeld
% =========================
n = size(A,1);
beta = zeros(n,1);

for i = 1:n
    soma = 0;
    for j = 1:n
        if j < i
            soma = soma + abs(A(i,j)) * beta(j);
        elseif j > i
            soma = soma + abs(A(i,j));
        end
    end
    beta(i) = soma / abs(A(i,i));
end

fprintf("\nCoeficientes de Sassenfeld:\n");
for i = 1:n
    fprintf("β(%d) = %.5f\n", i, beta(i));
end

if max(beta) < 1
    fprintf("O critério de Sassenfeld é satisfeito (convergência garantida).\n");
else
    fprintf("O critério de Sassenfeld NÃO é satisfeito (convergência não garantida).\n");
end

% =========================
% Método de Gauss-Seidel
% =========================
x = x0;
dr = tol + 1;
itr = 0;

fprintf("\nIteração\t   x(1)\t\t   x(2)\t\t   x(3)\t\tdr\n");
while dr > tol
    x_ant = x;
    x(1) = (b(1) - A(1,2)*x_ant(2) - A(1,3)*x_ant(3)) / A(1,1);
    x(2) = (b(2) - A(2,1)*x(1) - A(2,3)*x_ant(3)) / A(2,2);
    x(3) = (b(3) - A(3,1)*x(1) - A(3,2)*x(2)) / A(3,3);
    itr = itr + 1;
    dr = max(abs((x - x_ant) ./ x));
    fprintf("%5d\t\t%8.5f\t%8.5f\t%8.5f\t%e\n", itr, x(1), x(2), x(3), dr);
    if itr > 1000
        fprintf("O método não converge para a tolerância especificada.\n");
        break;
    end
end

% =========================
% Resultados finais
% =========================
if itr <= 1000
    fprintf("Solução final do sistema:\n");
    disp(x)
    fprintf("Total de Iterações: %d\n", itr)
    fprintf("dr final: %e\n", dr)
end