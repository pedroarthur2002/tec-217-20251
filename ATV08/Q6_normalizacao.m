% Matriz original
A = [8 2 -10;
    -9 1 3;
    15 -1 6];

% Normalização por linha
A_norm = zeros(size(A));
for i = 1:size(A, 1)
    linha_original = A(i, :);
    max_val = max(abs(linha_original));
    A_norm(i, :) = linha_original / max_val;

    % Mostrar informações da iteração
    fprintf("Iteração %d:\n", i);
    fprintf("  Linha original:    [%s]\n", num2str(linha_original));
    fprintf("  Máximo absoluto:   %.4f\n", max_val);
    fprintf("  Linha normalizada: [%s]\n\n", num2str(A_norm(i, :)));
end

% Exibir matriz normalizada final
disp("Matriz normalizada:");
disp(A_norm);

% Norma 1: maior soma absoluta de uma coluna
norma1 = max(sum(abs(A_norm), 1));

% Norma infinita: maior soma absoluta de uma linha
norma_inf = max(sum(abs(A_norm), 2));

% Exibir normas
fprintf("Norma 1: %.4f\n", norma1);
fprintf("Norma infinita: %.4f\n", norma_inf);

