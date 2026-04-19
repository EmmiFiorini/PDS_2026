%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %
% Función dedicada al grafico de señales individuales.                    %
%                                                                         %
% Sintaxis:                                                               %
%                                                                         %
%  Grafica(x,Lx,Ly,Ti)                                                    %
%                                                                         %
%       x: Señal a graficar                                               %
%       Lx: Título del eje x                                              %
%       Ly: Título del eje y                                              %
%       Ti: Tíulo de la ventana gráfica                                   % 
%                                                                         %
%                                                                         %
% Dr. Ing. Franco Martin Pessana                                          %
%                                                                         % 
% Facultad de Ingeniería y Ciencias Exactas y Naturales                   %
% Universidad Favaloro                                                    %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Grafica(x,Lx,Ly,Ti)

M = figure(1);
set(M,'NumberTitle','off','name',...
    strcat('Ejercicio N°8. Síntesis de Señal:',Ti),...
    'position',[20 50 1000 650],'menubar','none');
n = 0:length(x)-1;
maxx = max(n);
miny = min(x);
maxy = max(x);

h = plot(n,x);
xlabel(Lx)
ylabel(Ly)
axis([0 maxx miny maxy]);
grid
set(h,'LineWidth',1.5);