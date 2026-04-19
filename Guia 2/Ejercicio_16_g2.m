% Ejercicio 16 g2

% Ejercicio 16 - Guia 2 - Filtrado por Nivel
clc; clear;

%% Parametros
N  = 512;
fs = 20; 
Ts = 1/fs;
n  = 0:N-1;

%% Señal de entrada
A = 1; to = 1;
x = A * ((n*Ts >= 0) - (n*Ts >= to)); %un pulso

%% DFT de la entrada
X = fft(x, N);

%% Dos modos de umbral — elegís uno con el parametro 'modo'
modo = 'amplitud';   % 'amplitud' o 'energia'

% Tres niveles de umbral
if strcmp(modo, 'amplitud')
    niveles = [0.1, 0.3, 0.5] * max(abs(X)); % de la amplitud maxima
else
    E_total = sum(abs(X).^2);
    niveles = [0.01, 0.05, 0.10] * E_total;     % % de la energia total
end

%% Graficos
figure;
set(gcf, 'Name','Ej16 — Filtrado por Nivel','NumberTitle','off', ...
    'Position',[50 50 1400 800]);

colores = {'b','r','m'};
w_plot  = (0:N-1) * (2*pi/N);

for k = 1:3
    L = niveles(k);

    %% Filtro por nivel — pone a cero lo que NO supera L
    if strcmp(modo, 'amplitud')
        H_nivel      = abs(X) >= L;          % mascara binaria
    else
        H_nivel      = abs(X).^2 >= L;
    end

    Y = X .* H_nivel;        % aplico el filtro
    y = real(ifft(Y));       % señal filtrada

    %% Subplot fila k
    subplot(3, 3, (k-1)*3 + 1)
        plot(w_plot, abs(X), 'k', 'LineWidth', 0.8); hold on;
        plot(w_plot, abs(Y), colores{k}, 'LineWidth', 1.2);
        plot(w_plot, L*ones(1,N), 'g--', 'DisplayName', sprintf('L = %.2f', L));
        title(sprintf('Espectro — Nivel %d', k))
        xlabel('\omega (rad)'); ylabel('|X|'); grid on;
        legend('Original','Filtrada','Umbral')

    subplot(3, 3, (k-1)*3 + 2)
        plot(n, x, 'k'); hold on;
        plot(n, y, colores{k});
        title(sprintf('Señal filtrada — Nivel %d', k))
        xlabel('n'); ylabel('y[n]'); grid on;
        legend('Original','Filtrada')

    subplot(3, 3, (k-1)*3 + 3)
        plot(w_plot, abs(X) .* H_nivel, colores{k})
        title(sprintf('Componentes conservadas — Nivel %d', k))
        xlabel('\omega (rad)'); ylabel('|Y|'); grid on;
end

