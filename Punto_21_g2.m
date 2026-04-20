%guia 2 punto 21

clear
clc

%% 1) Señal original 
a = 20;
Ts = 0.001;
T0 = 0.70;
Fs = 1/Ts;

t0 = 0:Ts:T0-Ts;
N = length(t0);
x = exp(-a*t0);

X = fft(x);%Paso a frecuencia

% Creo el vector de frecuencias angulares digitales (w va de 0 a 2*pi)
w = (0:N-1) * (2*pi / N);

%% CREO LAS FUNCIONES
%M=2
M1 = 2;
wc1 = pi / M1;
H1 = (w <= wc1) | (w >= 2*pi - wc1); 
V1 = H1 .* X;%Aplico el filtro
v1 = real(ifft(V1));% AntitransforMO

%M=4
M2 = 4;
wc2 = pi / M2;
H2 = (w <= wc2) | (w >= 2*pi - wc2);
V2 = H2 .* X;
v2 = real(ifft(V2));

%M=8
M3 = 8;
wc3 = pi / M3;
H3 = (w <= wc3) | (w >= 2*pi - wc3);
V3 = H3 .* X;
v3 = real(ifft(V3));

%% V1
M1 = 2;
y1 = v1(1:M1:end);
Y1 = fft(y1);

%y2
M2= 4;
y2 = v1(1:M2:end);
Y2 = fft(y2);

%y3
M3= 8;
y3 = v1(1:M3:end);
Y3 = fft(y3);

figure;
subplot(3,1,1);
    stem(abs(Y1), 'filled','LineWidth', 1.5, 'Color', 'b');
    title('M = 2 v1'); xlabel('f'); ylabel('|V1|');
    
subplot(3,1,2);
    stem(abs(Y2), 'filled','LineWidth', 1.5, 'Color', 'b');
    title('M = 4 v1'); xlabel('f'); ylabel('|V1|');
    
subplot(3,1,3);
    stem(abs(Y3), 'filled','LineWidth', 1.5, 'Color', 'b');
    title('M = 8 v1'); xlabel('f'); ylabel('|V1|');
    

%% V2
M1 = 2;
y1_2 = v2(1:M1:end);
Y1_2 = fft(y1_2);

%y2
M2= 4;
y2_2 = v2(1:M2:end);
Y2_2 = fft(y2_2);

%y3
M3= 8;
y3_2 = v2(1:M3:end);
Y3_2 = fft(y3_2);

figure;
subplot(3,1,1);
    stem(abs(Y1_2), 'filled','LineWidth', 1.5, 'Color', 'r');
    title('M = 2 v2'); xlabel('f'); ylabel('|V2|');
    
subplot(3,1,2);
    stem(abs(Y2_2), 'filled','LineWidth', 1.5, 'Color', 'r');
    title('M = 4 v2'); xlabel('f'); ylabel('|V2|');
    
subplot(3,1,3);
    stem(abs(Y3_2), 'filled','LineWidth', 1.5, 'Color', 'r');
    title('M = 8 v2'); xlabel('f'); ylabel('|V2|');
    
    
%% V2
M1 = 2;
y1_3 = v3(1:M1:end);
Y1_3 = fft(y1_3);

%y2
M2= 4;
y2_3 = v3(1:M2:end);
Y2_3 = fft(y2_3);

%y3
M3= 8;
y3_3 = v3(1:M3:end);
Y3_3 = fft(y3_3);

figure;
subplot(3,1,1);
    stem(abs(Y1_3), 'filled','LineWidth', 1.5, 'Color', 'm');
    title('M = 2 v3'); xlabel('f'); ylabel('|V2|');
    
subplot(3,1,2);
    stem(abs(Y2_3), 'filled','LineWidth', 1.5, 'Color', 'm');
    title('M = 4 v3'); xlabel('f'); ylabel('|V3|');
    
subplot(3,1,3);
    stem(abs(Y3_3), 'filled','LineWidth', 1.5, 'Color', 'm');
    title('M = 8 v3'); xlabel('f'); ylabel('|V3|');