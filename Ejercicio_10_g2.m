%punto 10 g 2

%% A:
%1) escribo a w
w = linspace(0, 2*pi, 1024);

%2) escribo mi funcion
X = 0.0761 .* (1 - 0.763*exp(-1i*2*w) + exp(-1i*4*w)) ./ (1 + 1.355*exp(-1i*2*w) + 0.6196*exp(-1i*4*w));

%3) calculo la parte real y la imaginaria
X_real = real(X);
X_imag = imag(X);

%4) grafico
figure;

subplot(2,2,1);
    plot(w,X_real,'r');
    title('Parte Real 10a');
    xlabel('w'); ylabel('Re{X(e^j^w)}'); grid on;
    
subplot(2,2,3);
    plot(w,X_imag,'r');
    title('Parte Imaginaria 10a');
    xlabel('w'); ylabel('Img{X(e^j^w)}'); grid on;
    
subplot(2,2,2);
    plot(w,abs(X),'b');
    title('Modulo 10a');
    xlabel('w'); ylabel('|X(e^j^w)|'); grid on;
    
subplot(2,2,4);
    plot(w,angle(X),'b');
    title('Fase 10a');
    xlabel('w'); ylabel('angleX'); grid on;
    
%% b:
%% A:
%2) escribo mi funcion
X = (0.0518 - 0.1553*exp(-i*w)+0.1553*exp(-i*2*w)+0.0518*exp(-i*3*w))./(1+1.2828*exp(-i*w)+1.0388*exp(-i*2*w)+0.3418*exp(-i*3*w));

%3) calculo la parte real y la imaginaria
X_real = real(X);
X_imag = imag(X);

%4) grafico
figure;

subplot(2,2,1);
    plot(w,X_real,'r');
    title('Parte Real b');
    xlabel('w'); ylabel('Re{X(e^j^w)}'); grid on;
    
subplot(2,2,3);
    plot(w,X_imag,'r');
    title('Parte Imaginaria b');
    xlabel('w'); ylabel('Img{X(e^j^w)}'); grid on;
    
subplot(2,2,2);
    plot(w,abs(X),'b');
    title('Modulo b');
    xlabel('w'); ylabel('|X(e^j^w)|'); grid on;
    
subplot(2,2,4);
    plot(w,angle(X),'b');
    title('Fase b');
    xlabel('w'); ylabel('angleX'); grid on;