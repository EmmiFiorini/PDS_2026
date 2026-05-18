%ejercicio 2 g4

%% 1) escribo mis datos
fp = 60;
fs = 1000;
T=1/fs; %perido

N = 2000;
t = (0:N-1)/fs; %vector t
x = 2 * sin(2*pi*50*t) + sin(2*pi*300*t); %entrada


%% 2) Calculo mis valores
%Calculo el valor RC sabiendo que fp=1/(2piRC)
RC = 1/(2*pi*fp);

%elijo a mano R y C
R = 10*1000; %10K Omh
C = RC/R;

%% 3)Filtro analogico
num = [1];
den = [RC 1];

Hs = tf(num,den);

%% 4) Discretizacion
Hz = c2d(Hs,T,'tustin')

[b,a] = tfdata(Hz,'v')

% Respuesta en frecuencia
[H,f] = freqz(b,a,1024,fs);

%% 5) Calculo la salida real del sistema
y = filter(b,a,x);

%% 6) grafico
figure
subplot(3,1,1);
    plot(t,x,'r');
    xlabel('t');ylabel('x(t)');title('Entrada');

subplot(3,1,2);
    plot(t,y,'b');
    xlabel('t');ylabel('y(t)');title('Salida');
    
subplot(3,1,3);
    plot(f,20*log10(abs(H)),'m')
    grid on
    xlabel('Frecuencia [Hz]'); ylabel('|H(f)| dB'); title('Respuesta en Frecuencia del Filtro');