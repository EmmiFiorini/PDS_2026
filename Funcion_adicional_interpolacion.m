
function [w,V] = Funcion_adicional_interpolacion(x,L,N)
v = zeros(1, N*L);
v(1:L:end) = x;% Meto los valores de x saltando de a L
V = fft(v);% Espectro
w = (0:(N*L)-1)*(2*pi/(N*L));% Eje de frecuencia digital (0 a 2*pi
end