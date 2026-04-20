%PUNTO 16 G2

function y = filtroNivel(x,L)
if nargin < 2
        k = 0:20;
        x = (k >= 0) & (k <= 10);
        L = 0.8;
    end
X = fft(x);
H = abs(x)>L;
Y = H.*X;
y = real(ifft(Y));


% Módulo de X (Fila 1, Columna 1 -> Posición 1)
    subplot(2,3,1)
    stem(abs(X), 'filled', 'LineWidth', 1.5, 'Color', 'b');
    title('Módulo X');
    xlabel('k'); ylabel('|X|');

    % Fase de X (Fila 2, Columna 1 -> Posición 4)
    subplot(2,3,4)
    stem(angle(X), 'filled', 'LineWidth', 1.5, 'Color', 'b');
    title('Fase X');
    xlabel('k'); ylabel('Ang(X)');
    
    % ================= COLUMNA 2: H =================
    % Módulo de H (Fila 1, Columna 2 -> Posición 2)
    subplot(2,3,2)
    stem(abs(H), 'filled', 'LineWidth', 1.5, 'Color', 'r');
    title('Módulo H');
    xlabel('k'); ylabel('|H|');

    % Fase de H (Fila 2, Columna 2 -> Posición 5)
    subplot(2,3,5)
    stem(angle(H), 'filled', 'LineWidth', 1.5, 'Color', 'r');
    title('Fase H');
    xlabel('k'); ylabel('Ang(H)');
    
    % ================= COLUMNA 3: Y =================
    % Módulo de Y (Fila 1, Columna 3 -> Posición 3)
    subplot(2,3,3)
    stem(abs(Y), 'filled', 'LineWidth', 1.5, 'Color', 'm');
    title('Módulo Y');
    xlabel('k'); ylabel('|Y|');

    % Fase de Y (Fila 2, Columna 3 -> Posición 6)
    subplot(2,3,6)
    stem(angle(Y), 'filled', 'LineWidth', 1.5, 'Color', 'm');
    title('Fase Y');
    xlabel('k'); ylabel('Ang(Y)');
end