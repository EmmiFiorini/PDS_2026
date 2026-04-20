% punto 2 g3

clear
clc

% creo la funcion
z = [-1; 1i; -1i];
p = [0.9; 0.6718 + 0.6718i; 0.6718 - 0.6718i];
k = 1/77;

[b, a] = zp2tf(z, p, k);

disp('Coeficientes del numerador (b):');
disp(b);
disp('Coeficientes del denominador (a):');
disp(a);

%% 2) calculo cada una de ñas secuencias
% Vector de 100 muestras (de 0 a 99)
n = 0:99;

% --- Secuencia v1: Escalón unitario ---
% ones(1, 100) genera un vector de cien "unos"
v1 = ones(1, 100);
y1 = filter(b, a, v1);

% --- Secuencia v2: [1 -1 1 -1 ...] ---
% Matemáticamente esto es (-1)^n, que es lo mismo que una frecuencia en Nyquist (pi)
v2 = (-1).^n;
y2 = filter(b, a, v2);

% --- Secuencia v3: [1 0 -1 0 1 0 -1 ...] ---
% Matemáticamente esto equivale a cos(pi/2 * n)
v3 = cos((pi/2)*n);
v3 = round(v3); % Redondeamos para limpiar los decimales microscópicos que deja la función cos()
y3 = filter(b, a, v3);

%% 3) Gráficos para visualizar cómo responde el filtro a cada entrada
figure;

% Gráfico para v1
subplot(3,1,1);
plot(n, y1, 'LineWidth', 1.5, 'Color', 'b');
title('Salida y_1[n] (Respuesta al Escalón Unitario)');
xlabel('n'); ylabel('Amplitud'); grid on;

% Gráfico para v2
subplot(3,1,2);
% Graficamos solo las primeras 30 muestras con stem para que los palitos no se empasten
stem(n(1:30), y2(1:30), 'filled', 'Color', 'r', 'LineWidth', 1.5); 
title('Salida y_2[n] (Entrada oscilatoria: 1, -1, 1, -1...)');
xlabel('n'); ylabel('Amplitud'); grid on;

% Gráfico para v3
subplot(3,1,3);
stem(n(1:30), y3(1:30), 'filled', 'Color', 'g', 'LineWidth', 1.5);
title('Salida y_3[n] (Entrada: 1, 0, -1, 0...)');
xlabel('n'); ylabel('Amplitud'); grid on;

%% c) Encontrar la secuencia v[n] de período 4
disp('--- Inciso C ---');

% Para que la salida sea proporcional a (0.9)^n, la secuencia de entrada debe 
% cancelar el estado estacionario de la señal periódica (raíz en 1) y los 
% otros dos polos complejos del sistema (p2 y p3).
raices_a_cancelar = [1; p(2); p(3)];

% poly() nos da los coeficientes del polinomio, que forman nuestra secuencia v[n]
v_seq = poly(raices_a_cancelar);
v_seq = real(v_seq); % Limpiamos la parte imaginaria residual

disp('La secuencia v[n] de Período Fundamental de 4 puntos es:');
disp(v_seq);

% --- Comprobación visual ---
N_rep = 10; % Repetimos la secuencia 10 veces para armar la señal periódica
v_entrada = repmat(v_seq, 1, N_rep);
n_c = 0:(length(v_entrada)-1);

% Pasamos la señal por el filtro
y_c = filter(b, a, v_entrada);

% Generamos la curva teórica: y = K * (0.9)^n
% Calculamos K usando el valor real en n=3 para poder superponerlas
K_prop = y_c(4) / (0.9^3); 
y_teorica = K_prop * (0.9).^n_c;

% Gráfico de comprobación
figure('Name', 'Inciso C - Comprobación', 'NumberTitle', 'off');
plot(n_c, y_c, 'bo-', 'LineWidth', 1.5, 'DisplayName', 'Salida Real y[n]');
hold on;
plot(n_c, y_teorica, 'r*--', 'LineWidth', 1.5, 'DisplayName', 'Curva Teórica \propto (0.9)^n');

% --- DIBUJO DE LÍNEA VERTICAL COMPATIBLE CON VERSIONES VIEJAS ---
limites_y = ylim; % Obtenemos los límites actuales del eje Y
plot([3 3], limites_y, 'k--', 'LineWidth', 1.5, 'HandleVisibility', 'off');
text(3.2, limites_y(2)*0.8, 'n \geq 3', 'FontSize', 11, 'FontWeight', 'bold');
% ----------------------------------------------------------------

title('Comprobación: Salida del filtro vs (0.9)^n');
xlabel('Muestras (n)'); ylabel('Amplitud');
legend('Location', 'best'); grid on;