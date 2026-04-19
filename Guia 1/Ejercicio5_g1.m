% punto 5 guia 1

% Utilizando impz, calcule y grafique la respuesta al impulso de un sistema de tiempo

function [h,n] = Ejercicio5_g1(L,dk, pk)

%% 1) Si no ingresamos argumentos, usamos el ejemplo de la guía
    if nargin < 3
        % Lado derecho de la ecuación (entrada x) -> corresponden a 'B' o 'pk'
        pk = [0.8, -0.44, 0.16, 0.02]; 
        
        % Lado izquierdo de la ecuación (salida y) -> corresponden a 'A' o 'dk'
        dk = [1, 0.7, -0.45, -0.6];  
        
        % Longitud de la respuesta al impulso por defecto
        L = 40; 
    end

%% 2)Calculo la respuesta al impulso
[h, n] = impz(pk, dk, L); % impz devuelve la amplitud (h) y el vector de muestras (n)

%% 3) Graficamos el resultado
    figure('Name', 'PDS: TP1 Ej 5 - Respuesta al Impulso', 'MenuBar', 'none');
    stem(n, h, 'filled', 'b', 'LineWidth', 1.5);
    
    % Detalles del gráfico
    title('Respuesta al Impulso h[n]');
    xlabel('Muestras (n)');
    ylabel('Amplitud');
    grid on;

end