%Guia 1 PDS PUNTO 2
%EMMA FIORINI

% Programa para generar y graficar señales periódicas (Diente de sierra y Cuadrada)

%% 1) Ingresa los datos el usuario
disp('--- Parámetros de las señales ---');
L = input('Ingrese la longitud deseada de las secuencias L: ');
fs = input('Ingrese la frecuencia de muestreo en Hz: ');
A = input('Ingrese el valor pico A: ');
P = input('Ingrese la cantidad de períodos P: ');
duty = input('Ingrese el ciclo de trabajo para la onda cuadrada en %: ');

%% 2. Crear los vectores de tiempo y muestras
n = 0:(L-1);% Vector de índices de las muestras
t = n / fs;% Vector de tiempo en segundos

%% 3. Calcular la frecuencia de la señal
% Se necesitan P periodos en el tiempo total que duran las L muestras (L/fs)
f = (P * fs) / L;% Frecuencia en Hz

%% 4. Generar las secuencias
% La función sawtooth y square toman como argumento (2 * pi * f * t)
y_saw = A * sawtooth(2 * pi * f * t);
y_sq = A * square(2 * pi * f * t, duty);

%% 5. Graficar las secuencias utilizando 'stem'
figure('Name', 'Generador de Señales Discretas', 'NumberTitle', 'off');

% Gráfica Diente de Sierra
subplot(2, 1, 1);
stem(n, y_saw, 'filled', 'b');
title(sprintf('Señal Diente de Sierra (%d períodos)', P));
xlabel('Muestra (n)');
ylabel('Amplitud');
grid on;
ylim([-A-1, A+1]); % Ajustar el eje Y para que se vea mejor

% Gráfica Onda Cuadrada
subplot(2, 1, 2);
stem(n, y_sq, 'filled', 'r');
title(sprintf('Señal Cuadrada (Ciclo de trabajo = %d%%)', duty));
xlabel('Muestra (n)');
ylabel('Amplitud');
grid on;
ylim([-A-1, A+1]);