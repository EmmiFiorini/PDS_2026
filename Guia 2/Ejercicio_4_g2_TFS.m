%punto 4 g2

function [G, n] = Ejercicio_4_2_TFS(a, L)
%% 1) controlo los argumentos
    if nargin < 2
        L = 2;
    end

    if nargin < 1
        a = [2 5 3];
    end

%% 2) sobremostro
    g = zeros(1, length(a)*L);
    g(1:L:end) = a;

%% 3) creo mi eje temporal
    n = 0:length(g)-1;

%% 4) TFS
    N = 64;
    A = fft(a, N);
    G = fft(g, N);

    f = 0:N-1;
%% 5)grafico 1
    figure;

    subplot(2,1,1)
    stem(0:length(a)-1, a,'m')
    title('Señal original x[n]')
    xlabel('n');
    ylabel('x[n]');
    grid on;

    subplot(2,1,2)
    stem(n, g,'r')
    title('Señal sobremuestreada g[n]')
    xlabel('n');
    ylabel('g[n]');
    grid on;

%% 6) grafico 2
    figure;
    subplot(2,2,1)
    plot(f, abs(A), 'm')
    title('Magnitud ORIGINAL')
    xlabel('k');
    ylabel('|X[k]|');
    grid on;

    subplot(2,2,3)
    plot(f, unwrap(angle(A)), 'm')
    title('Fase ORIGINAL')
    xlabel('k')
    ylabel('Fase{X[k]} (rad)')
    grid on;

    subplot(2,2,2)
    plot(f, abs(G),'r')
    title('Magnitud SOBREMUESTREADA');
    xlabel('k');
    ylabel('|X[k]|');
    grid on;

    subplot(2,2,4)
    plot(f, unwrap(angle(G)),'r')
    title('Fase SOBREMUESTREADA')
    xlabel('k')
    ylabel('Fase{X[k]} (rad)')
    grid on;

end