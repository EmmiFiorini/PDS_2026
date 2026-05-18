% Ejercicio  guia 4

%% 1) cargo los datos en la funcion arma
Q = 1;
P = 2;
load 'ecg_nt_long_E_6.txt';
d = ecg_nt_long_E_6;
t = linspace(0, length(d), length(d)); %vector t
x = sin(2*pi*f*t);
[B,A,yk,ek] = ARMA_Adaptativo(x',d',P,Q);

%% 2) grafico:
figure
subplot(2,1,1);
    plot(t,d,'r');
    xlabel('t'); ylabel('ECG'); title('ECG sin filtar');

subplot(2,1,2);
    plot(t,yk,'m');
     xlabel('t'); ylabel('ECG'); title('ECG filtrado');
