%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Ejercicio 6 TP#2
%%%
%%% Usado por los ejercicios 8, 9 y 10 del mismo TP
%%%
%%% Procesamiento Digital de Señales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% 
%%% Facultad de Ingeniería y Ciencias Exactas y Naturales
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [H,w] = Ejercicio_6_bis(B,A,k,Title)

[H,w] = freqz(B, A, k,'whole');
H1=figure(1);
    set(H1,'position',[50 50 1200 750],'Menubar','none',...
        'NumberTitle','off','name',Title);
% Graficado de la Respuesta en Frecuencia
subplot(2,2,1)
plot(w/(pi),real(H));
grid
title('parte real')
xlabel('\omega/\pi'); ylabel('Amplitud')
subplot(2,2,2)
plot(w/(pi),imag(H));
grid
title('Parte imaginaria')
xlabel('\omega/\pi'); ylabel('Amplitud')
subplot(2,2,3)
plot(w/(pi),abs(H));
grid
title('Espectro de Magnitud')
xlabel('\omega/\pi'); ylabel('Magnitud')
subplot(2,2,4)
plot(w/(pi),angle(H));
grid
title('espectro de Fase')
xlabel('\omega/\pi'); ylabel('Fase, radianes')