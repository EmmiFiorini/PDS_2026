%punto 7 g2

function [x,n] = Ejercicio_7_g2(X_real, X_imag,n)
clear;
clc;
%% 1) Controlo argumentos
    if nargin < 1
        X_real = [39 -5.5 -1.5 -1.5 -1.5 -5.5];
        X_imag = [0  8.66  1.73 0  -1.73  -8.66];
    end
    
    if nargin < 3
        n = 0:length(X_real)-1;
    end
    
%% 2) Escribo mi X completa
    X = X_real + i*X_imag;
    N = length(X);
   
%% 3)IDFT manual
    x = zeros(1,N); %la creo mi variable y ahora la voy a empezar a poner valores
    
    for nn = 0:N-1
        for k = 0:N-1
            x(nn+1) = x(nn+1) + X(k+1) * exp(1j * 2*pi * k * nn / N);
        end
    end
    x = x / N;
    
%% 4) Verifico parte imaginaria ~0
    fprintf('Parte imaginaria maxima: %.2e\n', max(abs(imag(x))));
    x = real(x);

%% 5) Verificacion vs ifft()
    x_matlab = real(ifft(X));
    fprintf('Diferencia maxima vs ifft(): %.2e\n', max(abs(x - x_matlab)));

%% 6) Graficos
    figure;

    subplot(3,1,1)
        stem(n, X_real, 'b', 'filled')
        title('Parte Real de X[k]')
        xlabel('k'); ylabel('Re\{X[k]\}'); grid on;

    subplot(3,1,2)
        stem(n, X_imag, 'm', 'filled')
        title('Parte Imaginaria de X[k]')
        xlabel('k'); ylabel('Im\{X[k]\}'); grid on;

    subplot(3,1,3)
        stem(n, x, 'r', 'filled')
        title('Señal recuperada x[n]')
        xlabel('n'); ylabel('x[n]'); grid on;

end