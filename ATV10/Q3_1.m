% Dados da Questão 1
x = [0, 0.5, 1.0];
f = [1.0, 2.12, 3.55];

% Construção da matriz de Vandermonde e resolução do sistema
V = [x'.^2, x', ones(3,1)];
a = V \ f'; % Coeficientes do polinômio (resolve V*a = f)

% Define o range de x automaticamente (10% além dos limites)
x_min = min(x) - 0.1*(max(x)-min(x));
x_max = max(x) + 0.1*(max(x)-min(x));
xx = linspace(x_min, x_max, 100); % 100 pontos no range

% Avaliação do polinômio
P2_xx = polyval(a, xx);
x_eval = 0.7;
P2_eval = polyval(a, x_eval);

% Plot
figure;
plot(xx, P2_xx, 'b-', 'LineWidth', 2); hold on; % Curva do polinômio
plot(x, f, 'ro', 'MarkerSize', 10, 'LineWidth', 2); % Pontos originais
plot(x_eval, P2_eval, 'k*', 'MarkerSize', 10); % Ponto interpolado
xlabel('x'); ylabel('P2(x)');
title('Polinômio Interpolador P2(x) - Questão 1');
legend('P2(x)', 'Dados originais', 'P2(0.7)', 'Location', 'NorthWest');
grid on;
xlim([x_min, x_max]); % Ajusta os limites do eixo x

% Mostra os coeficientes e o valor interpolado
disp('Coeficientes do polinômio:');
fprintf('P2(x) = %.4f x² + %.4f x + %.4f\n', a(1), a(2), a(3));
fprintf('P2(0.7) = %.4f\n', P2_eval);
