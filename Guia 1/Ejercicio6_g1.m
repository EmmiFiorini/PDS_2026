% PUNTO 6 G1

% calcular y[n] para x=delta
%calcular algoriticamente  128 puntos  h[n]


%% i:
pk = [0.3 0.6 0.3]; %ewscribo de la primera
dk = [1 0 0.9]; %ewscribo de la primera
L = 128;

[h_algo, n] = impz(pk, dk, L);

h_analitico = zeros(size(n));

% Gráfico comparativo
figure('Name', 'PDS: TP1 Ej 6', 'MenuBar', 'none', 'Position', [100 100 800 500]);

% 1. Dibujamos la respuesta analítica (como una línea continua roja)
plot(n, h_analitico, 'r', 'LineWidth', 2);
hold on; % Clave para superponer el siguiente gráfico

% 2. Dibujamos la respuesta algorítmica (con palitos azules)
stem(n, h_algo, 'filled', 'b', 'LineWidth', 1.5, 'MarkerSize', 4);
hold off;

% Detalles del gráfico
title('Respuesta al Impulso: Analítica vs Algorítmica a');
xlabel('Muestras (n)');
ylabel('Amplitud h[n]');
legend('Analítica (Parte a)', 'Algorítmica (Parte b)');
grid on;

%% i:
pk = [1 1/2 0]; %ewscribo de la 2 x
dk = [1 1.8*cos(pi/16) 0.81]; %ewscribo de la 2 y
L = 128;

[h_algo, n] = impz(pk, dk, L);

h_analitico = zeros(size(n));

%% Gráfico comparativo
figure('Name', 'PDS: TP1 Ej 6', 'MenuBar', 'none', 'Position', [100 100 800 500]);

% 1. Dibujamos la respuesta analítica (como una línea continua roja)
plot(n, h_analitico, 'r', 'LineWidth', 2);
hold on; % Clave para superponer el siguiente gráfico

% 2. Dibujamos la respuesta algorítmica (con palitos azules)
stem(n, h_algo, 'filled', 'b', 'LineWidth', 1.5, 'MarkerSize', 4);
hold off;

% Detalles del gráfico
title('Respuesta al Impulso: Analítica vs Algorítmica b');
xlabel('Muestras (n)');
ylabel('Amplitud h[n]');
legend('Analítica (Parte a)', 'Algorítmica (Parte b)');
grid on;
