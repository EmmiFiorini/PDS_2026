%Ejercicio 7 guia 4

%graficar la respuesta en frecuencia
clc;
clear;
close all;

%% 1) escribo los datos de la consigana:
fs = 48*1000; %frecuencia de muestreo
Q = 0;
P = 2;
load 'noise.mat';
load 'recNoise.mat';
x = noise;
d = recNoise;

%% 2) llamo a arma
[B,A,yk,ek] = ARMA_Adaptativo(x,d,P,Q);
sound(yk,fs); %aca reproduce la cancion sin ruido

%% 3) grafico
t = 0:length(d)-1;
figure
subplot(3,1,1);
    plot(t,x,'r');
    xlabel('t');ylabel('x(t)');title('Noise');
    
subplot(3,1,2);
    plot(t,d,'b');
    xlabel('t');ylabel('d(t)');title('recNoise');
    
    
 subplot(3,1,3);
    plot(t,yk,'m');
    xlabel('t');ylabel('y(t)');title('Salida');


