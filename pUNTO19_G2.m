% 19 G2

clear
clc

%% 1) Señal original 
a = 20;
Ts = 0.001;
T0 = 0.70;
Fs = 1/Ts;

t0 = 0:Ts:T0-Ts;
x = exp(-a*t0);

%% 2) calcul0 las y
%y1
M1 = 2;
y1 = x(1:M1:end);
Y1 = fft(y1);

%y2
M2= 4;
y2 = x(1:M2:end);
Y2 = fft(y2);

%y3
M3= 8;
y3 = x(1:M3:end);
Y3 = fft(y3);

%% 3) grafico0:
figure;
subplot(3,1,1);
    stem(abs(Y1), 'filled','LineWidth', 1.5, 'Color', 'b');
    title('M = 2'); xlabel('f'); ylabel('|Y|');
    
subplot(3,1,2);
    stem(abs(Y2), 'filled','LineWidth', 1.5, 'Color', 'b');
    title('M = 4'); xlabel('f'); ylabel('|Y|');
    
subplot(3,1,3);
    stem(abs(Y3), 'filled','LineWidth', 1.5, 'Color', 'b');
    title('M = 8'); xlabel('f'); ylabel('|Y|');
