% Dados fornecidos
x = [0, 0.5, 1.0];
f = [1.3, 2.5, 0.9];
n = length(x);

% Polinômios de Lagrange L0, L1, L2
L0 = @(x_val) ((x_val - x(2)).*(x_val - x(3))) / ((x(1) - x(2))*(x(1) - x(3)));
L1 = @(x_val) ((x_val - x(1)).*(x_val - x(3))) / ((x(2) - x(1))*(x(2) - x(3)));
L2 = @(x_val) ((x_val - x(1)).*(x_val - x(2))) / ((x(3) - x(1))*(x(3) - x(2)));

% Polinômio interpolador P2(x)
P2 = @(x_val) f(1)*L0(x_val) + f(2)*L1(x_val) + f(3)*L2(x_val);

% Estimativa de f(0.8)
x_eval = 0.8;
f_est = P2(x_eval);
fprintf('P2(0.8) = %.4f\n', f_est);

% Gráficos
xx = linspace(0, 1, 100);

figure;
hold on;

% Plot dos polinômios base Li
plot(xx, L0(xx), 'r-', 'LineWidth', 1.5, 'DisplayName', 'L0(x)');
plot(xx, L1(xx), 'g-', 'LineWidth', 1.5, 'DisplayName', 'L1(x)');
plot(xx, L2(xx), 'b-', 'LineWidth', 1.5, 'DisplayName', 'L2(x)');

% Plot do polinômio interpolador P2(x)
plot(xx, P2(xx), 'k--', 'LineWidth', 2, 'DisplayName', 'P2(x)');

% Plot dos pontos originais
plot(x, f, 'ko', 'MarkerSize', 8, 'LineWidth', 2, 'DisplayName', 'Dados');

% Configurações do gráfico
xlabel('x');
ylabel('y');
title('Polinômios de Lagrange e Interpolador P2(x)');
legend('show');
grid on;
hold off;

% Mostra as expressões dos polinômios
disp('Polinômios de Lagrange:');
fprintf('L0(x) = (x - %.1f)(x - %.1f)/%.2f\n', x(2), x(3), (x(1)-x(2))*(x(1)-x(3)));
fprintf('L1(x) = (x - %.1f)(x - %.1f)/%.2f\n', x(1), x(3), (x(2)-x(1))*(x(2)-x(3)));
fprintf('L2(x) = (x - %.1f)(x - %.1f)/%.2f\n\n', x(1), x(2), (x(3)-x(1))*(x(3)-x(2)));

disp('Polinômio Interpolador P2(x):');
fprintf('P2(x) = %.1f*L0(x) + %.1f*L1(x) + %.1f*L2(x)\n', f(1), f(2), f(3));
