%Ejercicio 4 guia 4

clc;
clear;
close all;

%% escribo num y denominador de H
b = [1 0 0];
a = [1 -1.2 0.6];

%% Entrada
N = 3000;
rng(1);
x = 0.5*randn(N,1);

%% Señal deseada

d = filter(b,a,x);

%% Ordenes
P = 2;
Q = 2;

%% Identificacion adaptativa

[B,A,yk,ek] = ARMA_Adaptativo(x,d,P,Q);