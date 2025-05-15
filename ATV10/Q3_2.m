% Dados da Questão 2
x = [0, 0.5, 1.0]';  % Pontos x_i (como vetor coluna)
f = [1.3, 2.5, 0.9]'; % Valores f(x_i) (como vetor coluna)

% Construção da matriz de Vandermonde (para grau 2: [x² x 1])
V = [x.^2, x, ones(3,1)];

% Resolução do sistema linear V*a = f (usando operador \ do Octave)
a = V \ f; % Coeficientes do polinômio [a2; a1; a0]

% Expressão do polinômio
disp('Polinômio interpolador P2(x) = a2*x² + a1*x + a0:');
fprintf('P2(x) = %.4f x² + %.4f x + %.4f\n\n', a(1), a(2), a(3));

% Avaliação em x = 0.8 (exemplo)
x_eval = 0.8;
P2_eval = a(1)*x_eval^2 + a(2)*x_eval + a(3);
fprintf('P2(%.1f) = %.4f\n', x_eval, P2_eval);

% Plot do gráfico (com range estendido)
xx = linspace(min(x)-0.2, max(x)+0.2, 100); % 100 pontos de -0.2 a 1.2
P2_xx = a(1)*xx.^2 + a(2)*xx + a(3);

figure;
plot(xx, P2_xx, 'b-', 'LineWidth', 2); hold on;
plot(x, f, 'ro', 'MarkerSize', 10, 'LineWidth', 2);
xlabel('x'); ylabel('P2(x)');
title('Polinômio Interpolador P2(x) - Matriz de Vandermonde');
legend('P2(x)', 'Dados originais', 'Location', 'NorthWest');
grid on;
