%GUIA 2 P20

clear
clc

%% 1) Señal original 
a = 20;
Ts = 0.001;
T0 = 0.70;
Fs = 1/Ts;

t0 = 0:Ts:T0-Ts;
N = length(t0);
x = exp(-a*t0);


X = fft(x);%Paso a frecuencia

% Creo el vector de frecuencias angulares digitales (w va de 0 a 2*pi)
w = (0:N-1) * (2*pi / N);

%% 2) Filtrado Pasa Bajos de Fase Cero
%M=2
M1 = 2;
wc1 = pi / M1;
H1 = (w <= wc1) | (w >= 2*pi - wc1); 
V1 = H1 .* X;%Aplico el filtro
v1 = real(ifft(V1));% AntitransforMO

%M=4
M2 = 4;
wc2 = pi / M2;
H2 = (w <= wc2) | (w >= 2*pi - wc2);
V2 = H2 .* X;
v2 = real(ifft(V2));

%M=8
M3 = 8;
wc3 = pi / M3;
H3 = (w <= wc3) | (w >= 2*pi - wc3);
V3 = H3 .* X;
v3 = real(ifft(V3));

%% 3) Gráficos de las señales filtradas en el tiempo
figure;

subplot(3,1,1);
stem(t0, v1, 'filled','LineWidth', 1.5, 'Color', 'r');
title('Señal v[n] filtrada (M = 2, \omega_c = \pi/2)');
xlabel('Tiempo (s)'); ylabel('Amplitud');
grid on;

subplot(3,1,2);
stem(t0, v2, 'filled','LineWidth', 1.5, 'Color', 'g');
title('Señal v[n] filtrada (M = 4, \omega_c = \pi/4)');
xlabel('Tiempo (s)'); ylabel('Amplitud');
grid on;

subplot(3,1,3);
stem(t0, v3, 'filled','LineWidth', 1.5, 'Color', 'b');
title('Señal v[n] filtrada (M = 8, \omega_c = \pi/8)');
xlabel('Tiempo (s)'); ylabel('Amplitud');
grid on;