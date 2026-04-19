%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Función para discretizar una señal subamortiguada senoidal. Llama a la  %
% funcion de toma de parametros y entrega sus valores a la funcion de     %
% graficado. Debe ingresarse la cantidad de puntos a sintetizar           %
%                                                                         %
%                                                                         %
% Dr. Ing. Franco Martin Pessana                                          %
%                                                                         % 
% Facultad de Ingeniería y Ciencias Exactas y Naturales                   %
% Universidad Favaloro                                                    %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function x = Amort(N,Opt)

if nargin<2
    Opt = 1; % 1 si se quiere graficar la señal generada
    N = 500;
end  
L1 = 'Amplitud';
L2 = 'Períodos';
L3 = 'Exponente';

[Am,Pe,Ex] = Init_Valor(L1,L2,L3);

n = 0:N-1; % Tiempo Discreto
x = Am*sin(2*pi*Pe*n/N).*exp(Ex*n);	% Armado de la senoidal amortiguada 
	
if (Opt)
    Grafica(x,'n[ ]','x[n]',' Amortiguada');
end



