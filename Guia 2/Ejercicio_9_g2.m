%Ejercicio 9 g2

function [G,n] = Ejercicio_9_g2(r, phi)
clear;
clc;
%% 1) Controlo argumentos
    if nargin < 3
        r = 1;
        phi = pi/4; %[rad]
    end
    
%% 2) Defino w como vector de frecuencias
    w = linspace(0, 2*pi, 1024);   % 1024 puntos entre 0 y 2?
    
    %% 3) caluclo G
  G = 1 ./ (1 - 2*r*cos(phi)*exp(-1i*w) + r^2*exp(-2*1i*w));
  n = 0:length(G)-1;
  
    %% 4) Graficos — subplot 2x2
    figure;

    % Parte Real (arriba-izquierda)
    subplot(2,2,1)
        plot(w, real(G), 'b')
        title(sprintf('Parte Real  —  r=%.2f, \\phi=%.2f rad', r, phi))
        xlabel('\omega (rad/muestra)'); ylabel('Re\{G\}')
        xticks([0 pi/2 pi 3*pi/2 2*pi])
        xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})
        grid on;

    % Parte Imaginaria (abajo-izquierda)
    subplot(2,2,3)
        plot(w, imag(G), 'm')
        title(sprintf('Parte Imaginaria  —  r=%.2f, \\phi=%.2f rad', r, phi))
        xlabel('\omega (rad/muestra)'); ylabel('Im\{G\}')
        xticks([0 pi/2 pi 3*pi/2 2*pi])
        xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})
        grid on;

    % Magnitud (arriba-derecha)
    subplot(2,2,2)
        plot(w, abs(G), 'r')
        title(sprintf('Magnitud |G|  —  r=%.2f, \\phi=%.2f rad', r, phi))
        xlabel('\omega (rad/muestra)'); ylabel('|G|')
        xticks([0 pi/2 pi 3*pi/2 2*pi])
        xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})
        grid on;

    % Fase (abajo-derecha)
    subplot(2,2,4)
        plot(w, unwrap(angle(G)), 'r')
        title(sprintf('Fase \\angleG  —  r=%.2f, \\phi=%.2f rad', r, phi))
        xlabel('\omega (rad/muestra)'); ylabel('Fase (rad)')
        xticks([0 pi/2 pi 3*pi/2 2*pi])
        xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})
        grid on;


    %% 5) Ubicacion de polos con fvtool
    % Denominador: 1 - 2r·cos(?)·z^{-1} + r²·z^{-2}
    % Multiplicando por z²: z² - 2r·cos(?)·z + r²
    b = [1];% numerador
    a = [1, -2*r*cos(phi), r^2];% denominador
    fvtool(b, a);% diagrama de polos y ceros

    n = w;   % devuelvo w como segundo argumento
end