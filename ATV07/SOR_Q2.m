% Método SOR (Successive Over-Relaxation) com critério de parada dr

% =========================
% Definição dos dados
% =========================
A = [2 -1 0 0 ;-1 2 -1 0;0 -1 2 -1; 0 0 -1 2];
b = [1 2 9 11];
x0 = [0; 0; 0; 0];
tol = 0.05;
w = 1.3;  % Fator de relaxação

fprintf("Matriz da questão 2 (SOR), w = %.2f\n", w);

% =========================
% Critério da Diagonal Estritamente Dominante
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
% Método SOR com parada por dr
% =========================
x = x0;
dr = tol + 1;
itr = 0;

fprintf("\nIteração\t   x(1)\t\t   x(2)\t\t   x(3)\t\t   x(4)\t\t  dr\n");
while dr > tol
    x_ant = x;
    for i = 1:n
        soma1 = A(i,1:i-1) * x(1:i-1);
        soma2 = A(i,i+1:n) * x_ant(i+1:n);
        x(i) = (1 - w)*x_ant(i) + w*(b(i) - soma1 - soma2)/A(i,i);
    end
    itr = itr + 1;
    dr = max(abs((x - x_ant) ./ x));
    fprintf("%5d\t\t%8.5f\t%8.5f\t%8.5f\t%8.5f\t%e\n", itr, x(1), x(2), x(3), x(4), dr);

    if itr > 1000
        fprintf("O método não converge para a tolerância especificada.\n");
        break;
    end
end

% =========================
% Resultados finais
% =========================
if itr <= 1000
    fprintf("\nMétodo finalizado com sucesso.\n");
    fprintf("Solução final do sistema:\n");
    disp(x)
    fprintf("Total de Iterações: %d\n", itr)
    fprintf("dr final: %e\n", dr)
end
