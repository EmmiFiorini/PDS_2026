% ejercicio 14 g2

% Ejercicio 14 - Guia 2
clc; clear;

%% Parametros
fs = 20;
Ts = 1/fs;
N  = 64;        % definís N primero
n  = 0:N-1;     % luego n

%% pulso:
A=1; 
to=1;
x1 = A *((n*Ts >= 0) - (n*Ts - to >= 0));
[X1,n] = Ejercicio_6_g2(x1,n); %llamo a la funcion

%% Amplitud Modulado
Ac=1; 
fm=1;
Am=1;
fc =5;

x2 = Ac*(1 + (Am/Ac) * sin(2*pi*fm*n*Ts)).*cos(2*pi*fc*n*Ts);
[X2,n] = Ejercicio_6_g2(x2,n); %llamo a la funcion

%% exponencial:
a = 1;
x3 = A*exp(a*(n*Ts-to)).*(n*Ts - to >= 0);
[X3,n] = Ejercicio_6_g2(x3,n);

%% Frecuencia Modulada
x4 = Ac*cos(2*pi*fc*n*Ts + Am*sin(2*pi*fm*n*Ts));
[X4,n] = Ejercicio_6_g2(x4,n);

%% delta de dirac
x5 = A * (n == round(to/Ts)); %DELTA
[X5,n] = Ejercicio_6_g2(x5,n);

%% sinc
fo = 2; % Asegurate de definir fo
to = 1; % Asegurate de definir to
x6 = sinc(2*fo*(n*Ts - to));
[X6,n] = Ejercicio_6_g2(x6,n);

%% amoprtiguadora
x7 = A * sin(2*pi*fo*n*Ts) .* exp(-a*n*Ts) .* (n*Ts >= 0);
[X7,n] = Ejercicio_6_g2(x7,n);