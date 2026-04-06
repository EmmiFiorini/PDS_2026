%15 GUIA 2

% Ejercicio 15 - Guia 2 - Filtros de Fase Cero
clc; clear;

%% Parametros
N  = 512;
w1 = round(N/8);    % frecuencia de corte 1 (en muestras)
w2 = round(N/4);    % frecuencia de corte 2 (solo para elimina banda y pasa banda)

%% Señal de entrada — usamos un pulso como en ej 14
fs = 20; Ts = 1/fs;
n  = 0:N-1;
A  = 1; to = 1;
x  = A * ((n*Ts >= 0) - (n*Ts >= to));

%% Calculo DFT de la entrada
X = fft(x, N);

%% --- 1) FILTRO PASA BAJOS ---
H_PB            = zeros(1, N);
H_PB(1:w1)      = 1;          % pasa de 0 a w1
H_PB(N-w1+1:N)  = 1;          % simetria: de N-w1 a N
y_PB = real(ifft(H_PB .* X));

%% --- 2) FILTRO ELIMINA BANDA ---
H_EB            = ones(1, N);
H_EB(w1:w2)     = 0;          % elimina de w1 a w2
H_EB(N-w2:N-w1) = 0;          % simetria
y_EB = real(ifft(H_EB .* X));

%% --- 3) FILTRO PASA ALTOS ---
H_PA            = zeros(1, N);
H_PA(w1:N-w1)   = 1;          % pasa de w1 a N-w1
y_PA = real(ifft(H_PA .* X));

%% --- 4) FILTRO PASA BANDA ---
H_PBanda            = zeros(1, N);
H_PBanda(w1:w2)     = 1;      % pasa de w1 a w2
H_PBanda(N-w2:N-w1) = 1;      % simetria
y_PBanda = real(ifft(H_PBanda .* X));

%% --- Graficos ---
filtros  = {H_PB,   H_EB,          H_PA,         H_PBanda};
salidas  = {y_PB,   y_EB,          y_PA,          y_PBanda};
nombres  = {'Pasa Bajos','Elimina Banda','Pasa Altos','Pasa Banda'};
colores  = {'b',    'm',           'r',           'g'};

w_plot = (0:N-1) * (2*pi/N);

for k = 1:4
    figure(k);
    set(gcf, 'Name', ['Ej15 — ' nombres{k}], 'NumberTitle','off', ...
        'Position', [100 100 1200 600]);

    subplot(2,2,1)
        plot(n, x, 'k')
        title('Señal original x[n]')
        xlabel('n'); ylabel('x[n]'); grid on;

    subplot(2,2,2)
        plot(w_plot, abs(filtros{k}), colores{k})
        title(['Respuesta en frecuencia H(\omega) — ' nombres{k}])
        xlabel('\omega (rad)'); ylabel('|H|'); grid on;
        xticks([0 pi/2 pi 3*pi/2 2*pi])
        xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})

    subplot(2,2,3)
        plot(n, salidas{k}, colores{k})
        title(['Señal filtrada y[n] — ' nombres{k}])
        xlabel('n'); ylabel('y[n]'); grid on;

    subplot(2,2,4)
        plot(w_plot, abs(fft(salidas{k})), colores{k})
        title('Espectro señal filtrada |Y(\omega)|')
        xlabel('\omega (rad)'); ylabel('|Y|'); grid on;
        xticks([0 pi/2 pi 3*pi/2 2*pi])
        xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})

end