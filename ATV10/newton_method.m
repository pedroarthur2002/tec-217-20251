% Dados fornecidos
x = [0, 0.5, 1.0];   % Pontos x_i
f = [1.0, 2.12, 3.55]; % Valores f(x_i)

% Algoritmo de Newton para interpolação
n = length(x);
difdiv = zeros(n, n);
difdiv(:,1) = f'; % Primeira coluna = f(x_i)

% Calcula diferenças divididas
for j = 2:n
    for i = 1:n-j+1
        difdiv(i,j) = (difdiv(i+1,j-1) - difdiv(i,j-1)) / (x(i+j-1) - x(i));
    end
end

% Coeficientes do polinômio de Newton
a0 = difdiv(1,1);
a1 = difdiv(1,2);
a2 = difdiv(1,3);

% Expressão do polinômio (sem pacote simbólico)
disp('Polinômio Interpolador P2(x):');
disp(['P2(x) = ', num2str(a0), ' + ', num2str(a1), '*(x - ', num2str(x(1)), ') + ', ...
      num2str(a2), '*(x - ', num2str(x(1)), ')*(x - ', num2str(x(2)), ')']);

% Forma expandida (calculada manualmente)
% P2(x) = a0 + a1*(x - x0) + a2*(x - x0)*(x - x1)
% Expandindo: P2(x) = (a2)*x^2 + (a1 - a2*(x0 + x1))*x + (a0 - a1*x0 + a2*x0*x1)
coef_x2 = a2;
coef_x1 = a1 - a2*(x(1) + x(2));
coef_x0 = a0 - a1*x(1) + a2*x(1)*x(2);

disp('Forma expandida:');
disp(['P2(x) = ', num2str(coef_x2), 'x^2 + ', num2str(coef_x1), 'x + ', num2str(coef_x0)]);

% Avalia P2(0.7)
x_eval = 0.7;
P2_07 = a0 + a1*(x_eval - x(1)) + a2*(x_eval - x(1))*(x_eval - x(2));
fprintf('\nP2(0.7) = %.4f\n', P2_07);

% Plot do polinômio e pontos
xx = linspace(0, 1, 100);
P2_xx = a0 + a1*(xx - x(1)) + a2*(xx - x(1)).*(xx - x(2));

figure;
plot(x, f, 'ro', 'MarkerSize', 10, 'LineWidth', 2); % Pontos originais
hold on;
plot(xx, P2_xx, 'b-', 'LineWidth', 2); % Polinômio
plot(x_eval, P2_07, 'k*', 'MarkerSize', 10); % P2(0.7)
xlabel('x');
ylabel('P2(x)');
title('Polinômio Interpolador de Newton (Grau 2)');
legend('Dados originais', 'P2(x)', 'P2(0.7)', 'Location', 'NorthWest');
grid on;
