% g1 punto 7
clear
clc
%% 1)escribo mis pk y dk
pk = [1 1/2 0]; %coeficiemntes x
dk = [1 1.8*cos(pi/16) 0.81]; %coeficientes y
L = 128;

%% 2) defino mi entrada
n = 0:(L-1);
x = 3 * (n >= 0); %escalon unitario

%% 3) uso filter para sacar y
y = filter(pk, dk, x);


%% 4) grafico:
subplot(1,2,1)
stem(n, y, 'b', 'filled', 'LineWidth', 1.5, 'MarkerSize', 4); % Corrección: (n, y)
title('Punto 7a: x=3u[n]');
xlabel('n');
ylabel('y[n]');

%% b:
%% 5) cambio mi x
x = 15 * (n >= 0); %escalon unitario

%% 6) uso filter para sacar y
y = filter(pk, dk, x);


%% 7) grafico:
subplot(1,2,2)
stem(n, y, 'm', 'filled', 'LineWidth', 1.5, 'MarkerSize', 4); % Corrección: (n, y)
title('Punto 7b: x=15u[n]');
xlabel('n');
ylabel('y[n]');
