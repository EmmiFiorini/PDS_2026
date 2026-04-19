% ejercicio 5 guia 2

function [Y, n] = Ejercicio_5_2(a, M)
%% 1) controlo los argumentos
    if nargin < 2
        M = 2;
    end

    if nargin < 1
        a = [1 3 5 7 9 8 6];
    end

%% 2) submuestreo
    y = a(1:M:end);

%% 3) creo mi eje temporal
    n  = 0:length(y)-1;
    na = 0:length(a)-1;

%% 4) FFT de ambas señales
    N  = 64;
    A  = fft(a, N);   % espectro original
    Y  = fft(y, N);   % espectro submuestreado
    w  = (0:N-1)*(2*pi/N);
    
%% 5) Figura 1: señales en tiempo (stem)
   figure;
    subplot(2,1,1)
        stem(na, a, 'm')
        title('Señal original x[n]')
        xlabel('n'); ylabel('x[n]'); grid on;
    subplot(2,1,2)
        stem(n, y, 'r')          % <-- FIX: era 'g', debe ser 'y'
        title(['Señal submuestreada y[n]  (M=' num2str(M) ')'])
        xlabel('n'); ylabel('y[n]'); grid on;

%% 6) Figura 2: subplot 2x2 — Amplitud y Fase
%      Columna izquierda  (1,3): ORIGINAL   ? magenta
%      Columna derecha    (2,4): SUBMUESTREADA ? rojo

    figure;

    % --- Amplitud original (arriba-izquierda) ---
    subplot(2,2,1)
        plot(w, abs(A), 'm')
        title('Amplitud |X(e^{j\omega})| — Original')
        xlabel('\omega (rad/muestra)'); ylabel('|X|'); grid on;

    % --- Amplitud submuestreada (arriba-derecha) ---
    subplot(2,2,2)
        plot(w, abs(Y), 'r')
        title(['Amplitud |Y(e^{j\omega})| — Submuestreada (M=' num2str(M) ')'])
        xlabel('\omega (rad/muestra)'); ylabel('|Y|'); grid on;

    % --- Fase original (abajo-izquierda) ---
    subplot(2,2,3)
        plot(w, unwrap(angle(A)), 'm')
        title('Fase \angleX(e^{j\omega}) — Original')
        xlabel('\omega (rad/muestra)'); ylabel('Fase (rad)'); grid on;

    % --- Fase submuestreada (abajo-derecha) ---
    subplot(2,2,4)
        plot(w, unwrap(angle(Y)), 'r')
        title(['Fase \angleY(e^{j\omega}) — Submuestreada (M=' num2str(M) ')'])
        xlabel('\omega (rad/muestra)'); ylabel('Fase (rad)'); grid on;

end