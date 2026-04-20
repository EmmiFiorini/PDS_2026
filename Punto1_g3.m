% PUNTO 1 G3

clear
clc

% 1) Defino las variables como VECTORES FILA (separados por comas o espacios)
a = [1, -0.8741, 0.9217, -0.2672];
b = [0.1866, 0.2036, 0.2036, 0.1866];

%% a) Espacio de Estados y Fracciones Simples
disp('--- Inciso A ---');
[A,B,C,D] = tf2ss(b,a)
[ro,po,ko] = residuez(b,a)

%% b) Polos y Ceros
disp('--- Inciso B ---');
[z,p,k] = tf2zp(b,a)

%% c) Respuesta en Frecuencia
N = 512;
[H, w] = freqz(b, a, N, 'whole'); 

figure;
subplot(2,1,1)
    plot(w, abs(H), 'LineWidth', 1.5, 'Color', 'b');
    title('Respuesta de Amplitud (C)');
    xlabel('\omega (rad/muestra)'); ylabel('|H(e^{j\omega})|');
    xlim([0 2*pi]); grid on;

subplot(2,1,2)
    plot(w, angle(H), 'LineWidth', 1.5, 'Color', 'r');
    title('Respuesta de Fase (C)');
    xlabel('\omega (rad/muestra)'); ylabel('Fase (rad)');
    xlim([0 2*pi]); grid on;
    
%% D)
disp('--- Inciso D ---');
n = 0:99;               % Los primeros 100 valores
impulso = (n == 0);     % Delta de Kronecker: vale 1 solo en n=0
h_filter = filter(b, a, impulso);

figure;
stem(n, h_filter, 'filled', 'Color', 'b');
title('Respuesta al impulso h[n] (D)');
xlabel('Muestras (n)'); ylabel('Amplitud'); grid on;