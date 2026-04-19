%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Ejercicio 8 TP#2
%%%
%%% Respuestas en Frecuencia de Filtros Digitales
%%%
%%% Procesamiento Digital de Señales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% 
%%% Facultad de Ingeniería y Ciencias Exactas y Naturales
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc

%%%% Ejercicio 8a)
k = 512;
B = [.16 -.48 .48 -.16];
A = [1 .13 .52 .3];
Ejercicio_6_bis(B,A,k,'PDS. TP#2. Respuesta Frecuencial Discreta. Ejercicio 8a');
pause
%%%% Ejercicio 8b)
k = 512;
B = [.634 0 -.634];
A = [1 0 -.268];
Ejercicio_6_bis(B,A,k,'PDS. TP#2. Respuesta Frecuencial Discreta. Ejercicio 8b');
pause
%%%% Ejercicio 8c)
k = 512;
B = [.634 0 .634];
A = [1 0 .268];
Ejercicio_6_bis(B,A,k,'PDS. TP#2. Respuesta Frecuencial Discreta. Ejercicio 8c');
pause
%%%% Ejercicio 8d)
k = 512;
B = [1 -5 10];
A = [10 -5 1];
Ejercicio_6_bis(B,A,k,'PDS. TP#2. Respuesta Frecuencial Discreta. Ejercicio 8d');




