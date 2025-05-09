% Valores dados
x = [4; 2; 7];

% Construir matriz de Vandermonde modificada
A = [x.^2, x, ones(3,1)];

% Calcular a inversa de A
A_inv = inv(A);

% Calcular norma infinito (soma das linhas)
norm_A = norm(A, inf);
norm_A_inv = norm(A_inv, inf);

% Número de condição
cond_infty = norm_A * norm_A_inv;

% Exibir resultados detalhados
disp(['Norma infinito de A: ', num2str(norm_A)]);
disp(['Norma infinito de A⁻¹: ', num2str(norm_A_inv)]);
disp(['Número de condição (norma infinito) = ', num2str(norm_A), ' * ', num2str(norm_A_inv), ...
      ' = ', num2str(cond_infty)]);

