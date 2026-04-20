% punto 22 g2

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

%% L=2
L1=2;
v1 = zeros(1, N*L1);
v1(1:L1:end) = x;% Meto los valores de x saltando de a L1
V1 = fft(v1);% Espectro
w1 = (0:(N*L1)-1)*(2*pi/(N*L1));% Eje de frecuencia digital (0 a 2*pi)

%% L=4
L2=4;
v2 = zeros(1, N*L2);
v2(1:L2:end) = x;% Meto los valores de x saltando de a L2
V2 = fft(v2);% Espectro
w2 = (0:(N*L2)-1)*(2*pi/(N*L2));% Eje de frecuencia digital (0 a 2*pi)

%% L=8
L3=8;
v3 = zeros(1, N*L3);
v3(1:L3:end) = x;% Meto los valores de x saltando de a L3
V3 = fft(v3);% Espectro
w3 = (0:(N*L3)-1)*(2*pi/(N*L3));% Eje de frecuencia digital (0 a 2*pi)

%% 3) Gráficos
figure;

subplot(3, 1, 1);
plot(w1, abs(V1), 'LineWidth', 1.5, 'Color', 'b');
title('Espectro sobremuestreado L = 2');
xlabel('\omega (rad)'); ylabel('|V1|');
xlim([0 2*pi]);
% Truco para que el eje X muestre los valores de pi
xticks([0 pi/2 pi 3*pi/2 2*pi]);
xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
grid on;

subplot(3, 1, 2);
plot(w2, abs(V2), 'LineWidth', 1.5, 'Color', 'g');
title('Espectro sobremuestreado L = 4');
xlabel('\omega (rad)'); ylabel('|V2|');
xlim([0 2*pi]);
xticks([0 pi/2 pi 3*pi/2 2*pi]);
xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
grid on;

subplot(3, 1, 3);
plot(w3, abs(V3), 'LineWidth', 1.5, 'Color', 'm');
title('Espectro sobremuestreado L = 8');
xlabel('\omega (rad)'); ylabel('|V3|');
xlim([0 2*pi]);
xticks([0 pi/2 pi 3*pi/2 2*pi]);
xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi'});
grid on;
 