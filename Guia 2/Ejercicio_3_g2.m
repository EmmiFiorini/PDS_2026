%Ejercicio 3 guia 2

%Verificar usando TDF y TDF^(-1)

clc; clear; close all;

%% 1) Creo mi funcion
a = [1 -1/2];

%% 2) elijo el largo de mi FFT
N = 10;

%% 3)calculo la rasnformada
A = fft(a, N);

%% 4) Calculo la inversa en frecuencia
B = 1 ./ A;

%% 5) calculo la señal inversa
b = ifft(B);

%% 6) imprimo
disp('b[n] = ');
disp(real(b));

% verificación
c = cconv(a, b, N)

figure;
stem(0:N-1, real(c));
title('a[n] * b[n]');
xlabel('n'); ylabel('Amplitud');