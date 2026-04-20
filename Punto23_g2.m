%PUNTO 23 G2

% 1) Defino valores
a = 20;
Ts = 0.001;
T0 = 0.70;
t0 = 0:Ts:T0-Ts;
x = exp(-a*t0);
N = length(x);

% Creo el vector de frecuencias angulares digitales (w va de 0 a 2*pi)
w = (0:N-1) * (2*pi / N);

%% 2) AHORA SÍ llamas a tu función para cada L:
[w1, V1] = Funcion_adicional_interpolacion(x, 2, N); % L = 2
[w2, V2] = Funcion_adicional_interpolacion(x, 4, N); % L = 4
[w3, V3] = Funcion_adicional_interpolacion(x, 8, N); % L = 8

%% 3) Filtrado

% --- Para L = 2 ---
L1 = 2;
wc1 = pi / L1;
% Usamos w1 y agregamos la ganancia L1
H1 = L1 * ((w1 <= wc1) | (w1 >= 2*pi - wc1)); 
Y1 = H1 .* V1;          % Aplico el filtro
y1 = real(ifft(Y1));    % Antitransformo al tiempo para ver si se interpoló

% --- Para L = 4 ---
L2 = 4;
wc2 = pi / L2;
% Usamos w2 y agregamos la ganancia L2
H2 = L2 * ((w2 <= wc2) | (w2 >= 2*pi - wc2)); 
Y2 = H2 .* V2;
y2 = real(ifft(Y2));

% --- Para L = 8 ---
L3 = 8;
wc3 = pi / L3;
% Usamos w3 y agregamos la ganancia L3
H3 = L3 * ((w3 <= wc3) | (w3 >= 2*pi - wc3)); 
Y3 = H3 .* V3;
y3 = real(ifft(Y3));

%% 4) Gráficos
% Para responder a la pregunta "¿Se ha conseguido la interpolación?"
% lo mejor es graficar la señal en el tiempo y usar 'plot' para verla suave.

figure;
subplot(3,1,1);
    plot(y1, 'LineWidth', 1.5, 'Color', 'b');
    title('Señal en el tiempo interpolada (L = 2)'); 
    xlabel('Muestras'); ylabel('Amplitud');
    grid on;
    
subplot(3,1,2);
    plot(y2, 'LineWidth', 1.5, 'Color', 'r');
    title('Señal en el tiempo interpolada (L = 4)'); 
    xlabel('Muestras'); ylabel('Amplitud');
    grid on;
    
subplot(3,1,3);
    plot(y3, 'LineWidth', 1.5, 'Color', 'g');
    title('Señal en el tiempo interpolada (L = 8)'); 
    xlabel('Muestras'); ylabel('Amplitud');
    grid on;