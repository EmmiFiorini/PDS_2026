%Punto 3 guia 3

clear
clc

% creo las matrices
A = [0.3639 0 0; 1.3639 0.5111 -0.8580; 0 0.858 0];
B = [1;1;0];
c_T = [1.3629 0.6019 0.3074];
d = [1];

%% a:
[num_tf, den_tf] = ss2tf(A, B, c_T, d);

disp('Coeficientes de la Función de Transferencia:');
disp('Numerador (b):'); disp(num_tf);
disp('Denominador (a):'); disp(den_tf);

% Calculamos los Polos (raíces del denominador)
polos = roots(den_tf);
% Calculamos los Autovalores de A
autovalores = eig(A);

disp('Polos de H(z) (usando roots):');
disp(polos);
disp('Autovalores de la matriz A (usando eig):');
disp(autovalores);

%% b) Respuesta al impulso h[n] resolviendo Ecuaciones de Estado
% Queremos h[n], por lo que la entrada v[n] debe ser un impulso
N = 50;
n = 0:N;
v = (n == 0); % Impulso: vale 1 en n=0, y 0 en el resto

% Inicializamos vectores para guardar la historia de las variables
x1 = zeros(1, N+1);
x2 = zeros(1, N+1);
x3 = zeros(1, N+1);
h_estado = zeros(1, N+1);

% Condición inicial del estado (reposo)
x_actual = [0; 0; 0];

for k = 1:(N+1)
    % 1. Calculamos la salida actual
    h_estado(k) = c_T * x_actual + d * v(k);
    
    % 2. Guardamos los estados actuales para graficarlos
    x1(k) = x_actual(1);
    x2(k) = x_actual(2);
    x3(k) = x_actual(3);
    
    % 3. Calculamos el estado siguiente (x[n+1])
    x_siguiente = A * x_actual + B * v(k);
    
    % 4. Actualizamos para la iteración que viene
    x_actual = x_siguiente;
end

% Gráficos pedidos con subplot(2,2,x)
figure('Name', 'Inciso B - Variables de Estado', 'NumberTitle', 'off');
subplot(2,2,1);
stem(n, x1, 'filled', 'Color', 'b'); title('Estado x_1[n]'); xlabel('n');
subplot(2,2,2);
stem(n, x2, 'filled', 'Color', 'g'); title('Estado x_2[n]'); xlabel('n');
subplot(2,2,3);
stem(n, x3, 'filled', 'Color', 'm'); title('Estado x_3[n]'); xlabel('n');
subplot(2,2,4);
stem(n, h_estado, 'filled', 'Color', 'r'); title('Salida h[n] (Por Estados)'); xlabel('n');

%% c) Comparación con el comando filter
% Usamos los coeficientes obtenidos en el inciso A
h_filter = filter(num_tf, den_tf, v);

figure('Name', 'Inciso C - Comparación', 'NumberTitle', 'off');
subplot(2,1,1);
stem(n, h_estado, 'filled', 'Color', 'r', 'LineWidth', 1.5);
title('Respuesta al impulso h[n] calculada por Ecuaciones de Estado');
xlabel('n'); ylabel('Amplitud'); grid on;

subplot(2,1,2);
stem(n, h_filter, 'filled', 'Color', 'k', 'LineWidth', 1.5);
title('Respuesta al impulso h[n] calculada con comando filter');
xlabel('n'); ylabel('Amplitud'); grid on;

% Podrás observar en el gráfico que ambos métodos dan exactamente la misma señal