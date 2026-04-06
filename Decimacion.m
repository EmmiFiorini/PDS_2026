%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% Ejemplo Global Decimación
%%%
%%% Procesamiento Digital de Señales
%%%
%%% Dr. Ing. Franco Martin Pessana
%%% FICEN
%%% Universidad Favaloro
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc

Ts = 0.001;
T0 = 0.70;
Fs = 1/Ts;

t0 = 0:Ts:T0-Ts;
N = length(t0);
f0 = (0:N-1)*Fs/N;
N2 = N/2;
t2 = (0:N2-1)*2*Ts;
f2 = (0:N2-1)*Fs/N2/2;
N4 = N2/2;
t4 = (0:N4-1)*4*Ts;
f4 = (0:N4-1)*Fs/N4/4;
N8 = ceil(N4/2);
t8 = (0:N8-1)*8*Ts;
f8 = (0:N8-1)*Fs/N8/8;
x = sin(2*pi*30*t0) + sin(2*pi*60*t0);
X = fft(x);
y2d = downsample(x,2);
Y2d = fft(y2d);
y2 = decimate(x,2);
y4d = downsample(x,4);
Y4d = fft(y4d);
y4 = decimate(x,4);
y8d = downsample(x,8);
Y8d = fft(y8d);
y8 = decimate(x,8);

H1=figure(1);
set(H1,'name','Señal submuestreada con M=2, 4 y 8','position',[10 20 1250 700],...
    'menubar','none');
subplot(4,1,1)
h = stem(t0(1:70),x(1:70),'r');
set(h,'linewidth',.6);
subplot(4,1,2)
h = stem(t0(1:70),x(1:70),'r');
set(h,'linewidth',.6);
ylabel('M=2')
hold on
h = stem(t2(1:round(70/2)),y2d(1:round(70/2)),'b','filled');
set(h,'linewidth',.6);
hold off
subplot(4,1,3)
h = stem(t0(1:70),x(1:70),'r');
set(h,'linewidth',.6);
ylabel('M=4')
hold on
h = stem(t4(1:round(70/4)),y4d(1:round(70/4)),'b','filled');
set(h,'linewidth',.6);
hold off
subplot(4,1,4)
h = stem(t0(1:70),x(1:70),'r');
set(h,'linewidth',.6);
xlabel('t (s)')
ylabel('M=8')
hold on
h = stem(t8(1:round(70/8)),y8d(1:round(70/8)),'b','filled');
set(h,'linewidth',.6);
hold off
disp('Presione cualquier tecla para continuar...')
pause;

H2=figure(2);
set(H2,'name','Espectros de Fourier con L=2, 4 y 8','position',[30 20 1250 700],...
    'menubar','none');
subplot(4,1,1)
h = stem(f0,abs(X),'r','filled');
set(h,'linewidth',.6);
subplot(4,1,2)
h = stem(f2,abs(Y2d),'b');
set(h,'linewidth',.6);
ylabel('M=2')
subplot(4,1,3)
h = stem(f4,abs(Y4d),'b');
set(h,'linewidth',.6);
ylabel('M=4')
subplot(4,1,4)
h = stem(f8,abs(Y8d),'b');
set(h,'linewidth',.6);
ylabel('M=8')
xlabel('f (Hz)')
disp('Presione cualquier tecla para continuar...')
pause;

H3=figure(3);
set(H3,'name','Señal Decimada con L=2, 4 y 8','position',[50 20 1250 700],...
    'menubar','none');
subplot(4,1,1)
h = stem(t0(1:70),x(1:70),'r');
set(h,'linewidth',.6);
subplot(4,1,2)
h = stem(t2(1:round(70/2)),y2(1:round(70/2)),'b','filled');
set(h,'linewidth',.6);
ylabel('M=2')
hold on
h = stem(t0(1:70),x(1:70),'r');
set(h,'linewidth',.6);
hold off
subplot(4,1,3)
h = stem(t4(1:round(70/4)),y4(1:round(70/4)),'b','filled');
set(h,'linewidth',.6);
ylabel('M=4')
hold on
h = stem(t0(1:70),x(1:70),'r');
set(h,'linewidth',.6);
hold off
subplot(4,1,4)
h = stem(t8(1:round(70/8)),y8(1:round(70/8)),'b','filled');
set(h,'linewidth',.6);
ylabel('M=8')
xlabel('t (s)')
hold on
h = stem(t0(1:70),x(1:70),'r');
set(h,'linewidth',.6);
hold off