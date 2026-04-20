
%ejercicio 18 g2

clear
clc
%% 1) creo mi funcion:
a=1;

Ts = 0.001;
T0 = 0.70;
Fs = 1/Ts;

t0 = 0:Ts:T0-Ts;
N = length(t0);
f0 = (0:N-1)*Fs/N;

x = exp(-a*t0);

%% 2) paso a frecuencia
X = fft(x);


%% 3) grafico
figure;
subplot(2,1,1)
    plot(f0, real(abs(X)), 'LineWidth', 1.5, 'Color', 'b');
    title('Módulo X');
    xlabel('f'); ylabel('|X|');

subplot(2,1,2)
    plot(f0, angle(X), 'LineWidth', 1.5, 'Color', 'b');
    title('Fase X');
    xlabel('f'); ylabel('Ang(X)');


