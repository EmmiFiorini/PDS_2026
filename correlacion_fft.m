function [rxy, lags] = correlacion_fft(x, y)
    % RUTINA DE CORRELACIÓN USANDO FFT
    % Si solo se ingresa 'x', calculamos la Autocorrelación (hacemos que y = x)
    if nargin < 2
        y = x;
    end

    % Asegurarnos de que ambas señales sean vectores fila
    x = x(:).';
    y = y(:).';

    Nx = length(x);
    Ny = length(y);

    % 1. Determinar el tamaño seguro para evitar aliasing circular
    N_seguro = Nx + Ny - 1;

    % 2. Pasar al dominio de la frecuencia (con zero-padding automático a N_seguro)
    X = fft(x, N_seguro);
    Y = fft(y, N_seguro);

    % 3. Aplicar la propiedad de Fourier para la correlación
    % Multiplicamos X por el complejo conjugado de Y
    Rxy_freq = X .* conj(Y);

    % 4. Volver al dominio del tiempo
    % Usamos 'real' para descartar residuos imaginarios minúsculos por redondeo
    rxy_crudo = real(ifft(Rxy_freq));

    % 5. Ordenar el resultado
    % La IFFT devuelve los retardos positivos y luego los negativos. 
    % Usamos fftshift para poner el lag 0 en el centro, como es costumbre.
    rxy = fftshift(rxy_crudo);

    % 6. Crear el vector de retardos (lags) para el eje X
    lags = -(Ny-1) : (Nx-1);
end