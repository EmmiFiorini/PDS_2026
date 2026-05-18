% Ejercicio 5 guia 4

%% 1) cargo los datos en la funcion arma
Q = 0;
P = 2;
load 'ecg_nt_Ejercicio_5.txt';
d = ecg_nt_Ejercicio_5;
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
