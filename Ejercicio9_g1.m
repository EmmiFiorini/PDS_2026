
% Guía 1 - Ejercicio 9

function Ejercicio9_g1()
    %% 1. Definición de parámetros y eje de tiempos
    fs = 100;% Frecuencia de muestreo
    Ts = 1/fs;
    N = 50; % Cantidad de muestras de nuestras señales
    n = 0:(N-1);
    
    %% 2. Generación de las señales
    % Señal x[n]: Pulso rectangular (Amplitud 1, duración 20 muestras)
    x = zeros(1, N);
    x(1:20) = 1; 
    
    % Señal h[n]: Respuesta al impulso de filtro pasabajos RC
    tau = 0.1; % Constante de tiempo RC = R*C
    h = exp(-n*Ts / tau); 
    
    %% 3. Cálculo de convoluciones
    % A) Usando nuestro propio algoritmo (definido al final del script)
    y_algoritmo = mi_convolucion(x, h);
    
    % B) Usando la función nativa de MATLAB
    y_matlab = conv(x, h);
    
    %% 4. Gráficos comparativos
    figure('Name', 'PDS: Convolución Ej 9', 'Position', [100, 100, 900, 600]);
    
    subplot(3,1,1);
    stem(n, x, 'k', 'filled', 'MarkerSize', 4); hold on;
    stem(n, h, 'r', 'filled', 'MarkerSize', 4); hold off;
    title('Señales de entrada: Pulso x[n] y Filtro h[n]'); legend('x[n]', 'h[n]');
    
    % Creamos el vector de tiempo para la salida (N + N - 1)
    ny = 0:(length(y_algoritmo)-1); 
    
    subplot(3,1,2);
    stem(ny, y_algoritmo, 'b', 'filled', 'MarkerSize', 4);
    title('Convolución con Algoritmo Propio');
    
    subplot(3,1,3);
    stem(ny, y_matlab, 'g', 'filled', 'MarkerSize', 4);
    title('Convolución con conv() de MATLAB');
    xlabel('Muestras (n)');
    
end

%% FUNCIÓN DE CONVOLUCIÓN PROPIA
function y = mi_convolucion(x, h)
    Nx = length(x);
    Nh = length(h);
    
    % 1. Inicializamos el vector de salida con ceros
    y = zeros(1, Nx + Nh - 1);
    
    % 2. Doble bucle for para aplicar la sumatoria
    for n = 1:length(y)
        for k = 1:Nx
            % Condición para no buscar índices negativos o fuera de rango en h
            if (n - k + 1) > 0 && (n - k + 1) <= Nh
                % Sumatoria: y[n] += x[k] * h[n-k]
                y(n) = y(n) + x(k) * h(n - k + 1);
            end
        end
    end
end