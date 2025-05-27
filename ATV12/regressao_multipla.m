clc;
clear;

% Dados da tabela
x1 = [0; 2; 2.5; 1; 4; 7];
x2 = [0; 1; 2; 2; 6; 2];
y  = [5; 10; 9; 6; 3; 27];
n = length(y);

% Montagem da matriz X com a coluna de 1s (intercepto)
X = [ones(n, 1), x1, x2];

% 1. MATRIZ DE SOMATÓRIOS (XᵗX) E VETOR Xᵗy
XtX = X' * X;
Xty = X' * y;

% Impressão da matriz de somatórios e vetor soma de produtos
printf("=== Etapa 1: Matriz de Somatórios (Xᵗ * X) ===\n");
disp(XtX);
printf("=== Etapa 1: Vetor Soma de Produtos (Xᵗ * y) ===\n");
disp(Xty);

% 2. SOLUÇÃO DO SISTEMA LINEAR: XtX * beta = Xty
beta = XtX \ Xty;

% Impressão dos coeficientes
printf("\n=== Etapa 2: Coeficientes da Regressão ===\n");
printf("beta0 (intercepto) = %.4f\n", beta(1));
printf("beta1 (x1)         = %.4f\n", beta(2));
printf("beta2 (x2)         = %.4f\n", beta(3));

% 3. AVALIAÇÃO E R²
y_pred = X * beta;
ss_res = sum((y - y_pred).^2);
ss_tot = sum((y - mean(y)).^2);
r2 = 1 - ss_res / ss_tot;
printf("Coeficiente de Determinação (R²) = %.4f\n", r2);

% 4. GRÁFICO 3D: Plano ajustado e pontos reais
[X1_grid, X2_grid] = meshgrid(linspace(min(x1), max(x1), 20), linspace(min(x2), max(x2), 20));
Y_grid = beta(1) + beta(2)*X1_grid + beta(3)*X2_grid;

figure;
mesh(X1_grid, X2_grid, Y_grid);
hold on;
plot3(x1, x2, y, 'ro', 'MarkerFaceColor', 'r');
xlabel('x1');
ylabel('x2');
zlabel('y');
title('Regressão Linear Múltipla - Plano Ajustado');
legend('Plano Ajustado', 'Pontos Reais');
grid on;

