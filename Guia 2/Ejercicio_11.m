%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Ejercicio 11 TP#2. Filtro Notch Digital
%%%
%%% Filtro Notch
%%%
%%% Procesamiento Digital de Señales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% 
%%% Facultad de Ingeniería y Ciencias Exactas y Naturales
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cómputo de Filtro Notch

clear
clc

k = 512;  %puntos para graficado de espectros
fo=50;  % Frecuencia de línea a eliminar
Fs=1000;  % Trecuencia de muestreo
wo=2*pi*fo/Fs; % Ángulo de ubicación de los ceros del filtro IIR
r = 0.9; % Magnitud de los polos
num = conv([1 -exp(-1j*wo)],[1 -exp(1j*wo)])
den = conv([1 -r*exp(-1i*wo)],[1 -r*exp(1i*wo)])
[h,w] = freqz(num, den, k);
H=figure(1);
set(H,'NumberTitle','off','Menubar','none','name',...
    'Filtro Notch. Ejercicio#11. FICEN UF','position',[20 50 1200 700]);
% Graficado de la Respuesta en Frecuencia
subplot(2,2,1)
g = plot(w,real(h));
set(g,'linewidth',1.2);
grid
title('parte real')
xlabel('omega [rad]'); ylabel('Amplitud')
subplot(2,2,2)
g = plot(w,imag(h));
set(g,'linewidth',1.2);
grid
title('Parte imaginaria')
xlabel('omega [rad]'); ylabel('Amplitud')
subplot(2,2,3)
g = plot(w,abs(h));
set(g,'linewidth',1.2);
grid
title('Espectro de Magnitud')
xlabel('omega [rad]'); ylabel('Magnitud')
subplot(2,2,4)
g = plot(w,angle(h));
set(g,'linewidth',1.2);
grid
title('espectro de Fase')
xlabel('omega [rad]'); ylabel('Fase, radianes')
N=250;
Ts=1/Fs;
t=0:Ts:(N-1)*Ts;
x=5*sin(2*pi*fo*t);
y=filter(num,den,x);
H=figure(2);
set(H,'NumberTitle','off','Menubar','none','name',...
    'Entrada y Salida del Filtro Notch. Ejercicio#11. FICEN UF',...
    'position',[50 20 1200 700]);
subplot(211)
g = plot(t,x);
set(g,'linewidth',1.2);
grid
xlabel('t [s]')
ylabel('x(t)')
subplot(212)
g= plot(t,y);
set(g,'linewidth',1.2);
xlabel('t [s]')
ylabel('y(t)')
grid
hold on
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Cálculo te tiempo de establecimiento del Filtro Notch
Max=max(y);
Umb=(abs(y)<0.01*Max)*Max;
for n=N:-1:1
    if Umb(n)==0
        IndTe = n;
        break
    end   
end
Test=t(IndTe);    % Tiempo de Establecimiento
g = plot(t,Umb,'g');
set(g,'linewidth',1.2);
disp('Tiempo de establecimiento (s) =')
Test