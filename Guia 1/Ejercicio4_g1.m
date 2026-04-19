%guia 1 punto 4
%emma fiorini


function x = Ejercicio4_g1(A, fo, tita, fs, L)

if nargin < 5
    A=3;
    fo=200;
    tita = pi/2;
    fs = .4e3;
    L = 40;
end

% Definimos los 4 casos de fs que pide la consigna
    fs_cases = [10*fo, 4.5*fo, 2*fo, fo/3];
    titulos = {'a) fs = 10 fo', 'b) fs = 4.5 fo', 'c) fs = 2 fo (Nyquist)', 'd) fs = fo/3 (Aliasing)'};

    % Creamos la figura principal (una sola vez)
    figure('Name', 'PDS. TP1 Ej 4', 'Position', [20 50 1200 700], 'MenuBar', 'none');

    for i = 1:4
        % 1. Tomamos la frecuencia de muestreo del caso actual
        fs_actual = fs_cases(i);
        Ts = 1/fs_actual;
        
        % 2. Vector de tiempo discreto (para los puntos muestreados)
        n = 0:(L-1);
        t_discrete = n * Ts; 
        
        % 3. Vector de tiempo continuo (alta resolución para que se vea suave)
        % Lo hacemos ir desde 0 hasta el final del tiempo discreto
        t_continuous = linspace(0, t_discrete(end), 1000);
        
        % 4. Recalculamos las señales para este fs específico
        x_t = A*sin(2*pi*fo*t_continuous + tita); % Señal continua
        x_n = A*sin(2*pi*fo*t_discrete + tita);   % Señal muestreada
        
        % 5. Graficamos en el subplot correspondiente (grilla 2x2, posición i)
        subplot(2, 2, i);
        
        % Usamos 'hold on' como exige la consigna
        plot(t_continuous, x_t, 'r', 'LineWidth', 1.5); 
        hold on;
        plot(t_discrete, x_n, 'ob', 'MarkerFaceColor', 'b', 'MarkerSize', 5); 
        hold off;
        
        % Configuración visual del gráfico
        title(titulos{i}, 'FontWeight', 'bold');
        legend('x(t) continua', 'x[n] discreta', 'Location', 'best');
        ylabel('Amplitud');
        xlabel('Tiempo (s)');
        grid on;
    end
end
