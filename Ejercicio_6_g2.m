%punto 6 g2

function [X,n] = Ejercicio_6_g2(x,n)
%% 1) Controlo argumentos
    if nargin < 1
        x = [1 3 5 7 9 8 6];
        n = 0:length(x)-1;
    end
    if nargin < 2
        n = 0:length(x)-1;
    end
    
%% 2) Calculo DFT manualmente
    N = length(x);
    X = zeros(1, N);
    
    for k = 0:N-1
        for nn = 0:N-1
            X(k+1) = X(k+1) + x(nn+1) * exp(-1j * 2 * pi * k * nn / N);
        end
    end
   
%% 3) Eje de frecuencia normalizada
    k = 0:N-1;
    w = k * (2*pi/N);   % frecuencia normalizada [0, 2?)

%% 4) Graficos — subplot 2x2
    figure;
    subplot(2,1,1)
        stem(w, abs(X), 'b', 'filled')
        title('Amplitud |X[k]|')
        xlabel('\omega = 2\pik/N (rad/muestra)')
        ylabel('|X[k]|')
        grid on;

    subplot(2,1,2)
        stem(w, unwrap(angle(X)), 'b', 'filled')
        title('Fase \angleX[k]')
        xlabel('\omega = 2\pik/N (rad/muestra)')
        ylabel('Fase (rad)')
        grid on;

%% 5) Verificacion con fft de Matlab
    X_matlab = fft(x);
    fprintf('Diferencia máxima vs fft(): %.2e\n', max(abs(X - X_matlab)));

end