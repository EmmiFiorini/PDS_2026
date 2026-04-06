%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 
%%% Ejercicio 2 TP#2. 
%%% Verificación del desplazamiento circular en dft o bien TF
%%%
%%% Procesamiento Digital de Señales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% 
%%% Facultad de Ingeniería y Ciencias Exactas y Naturales
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Ejercicio_2(n0)

if nargin < 1
    n0 = -4;
end
clc
disp('Secuencia de Entrada')
a = [1 2 3 4 5 6 7]  % Señal a desplazar
% Desplazamiento Circular
chain = ["Secuencia desplazada circularmente en",num2str(n0)];
disp(join(chain));
a_des = circshift(a,n0)
N = length(a); % Cantidad de puntos muestreados del círculo de R=1
k=0:N-1;
W_N=exp(-1j*2*pi/N);
W_N_nok = W_N.^(n0*k);
A = fft (a); % DFT de a[n]
A_d = A.*W_N_nok;  % DFT de la señal desplazada según propiedades de DFT
disp('Secuencia Desplazada Circularmente mediante propiedades de DFT')
a_d_dft = round(real(ifft(A_d)))   % IDFT de la señal desplazada round para
                                   % que no muestre decimales
