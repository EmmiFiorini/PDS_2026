%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Generación de delta de dirac, escalón unitario y rampa unitaria.        %
%                                                                         %
%                                                                         %
% Sintaxis:                                                               %
%                                                                         %
% function Ejercicio_1(L,Fs)                                              %
%                                                                         %
%     L = longitud de la señal deseada                                    %
%     Fs = Frecuencia de Muestreo                                         %
%                                                                         %
%                                                                         %
% Dr. Ing. Franco Martin Pessana                                          %
%                                                                         % 
% Facultad de Ingeniería y Ciencias Exactas y Naturales                   %
% Universidad Favaloro                                                    %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Ejercicio_1(L,Fs)

if nargin<2
    L = 200;
    Fs = 1000; % Hz
end
Ts = 1/Fs;
nTs = 0:Ts:(L-1)*Ts; % Tiempo discreto
x1 = zeros(size(nTs)); % Delta de Kronecker
x1(1) = 1;
x2 = ones(size(nTs)); % Escalón Unitario
x3 = 0:L-1; % rampa Unitaria
H = figure;
set(H,'name','PDS. TP#1. Ejercicio 1','position',[20 50 1200 700],'menubar','none');
subplot(3,1,1)
h = stem(nTs,x1);
set(h,'LineWidth',0.75)
grid
ylabel('d[n]');
xlabel('nTs [s]');
subplot(3,1,2)
h = stem(nTs,x2);
set(h,'LineWidth',0.75)
grid
ylabel('u[n]');
xlabel('nTs [s]');
subplot(3,1,3)
h = stem(nTs,x3);
set(h,'LineWidth',0.75)
grid
ylabel('n.u[n]');
xlabel('nTs [s]');