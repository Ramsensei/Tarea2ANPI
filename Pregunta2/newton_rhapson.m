function [xn, k, err, M] = newton_rhapson(f,xi,tol,iterMax)
% ESTA FUNCION PIDE LOS SIGUIENTES DATOS DE ENTRADA:

% f = Vector de funciones que conforman el sistema de ecuaciones.
% xi = Vector de valores iniciales de las variable independientes.
    %ej. [1,2]
% tol = Tolerancia de error.
% iterMax = Número máximo de iteraciones.

% VARIABLES DE SALIDA:

% xn = Ultimas iteraciones de las raices de la función.
% k = Número de iteraciones.
% err = Error de las iteraciones.
% M = Tabla de resultados.

%Protección contra errores en las entradas.

pkg load symbolic;

if nargin ~= 4
    error('Se necesita definir un vector de funciones, un vector de valores iniciales, un número máximo de iteraciones y un error aproximado mínimo');
elseif size(xi,1) ~= 1
        xi = transpose(xi);
elseif isstring(f(1))
    error('La función no está actualizada para ser ejecutada en versiones nuevas de Octave con strings, por favor ingrese las funciones como arrays de caracteres');
end



for i = 1:size(f,1)
    Fs(i) = sym(f(i,:));
endfor
vs = symvar(Fs);
% disp("El jacobiano de f1 y f2 es:")
J = jacobian(Fs);
ea = [0, 0];

if length(vs) ~= length(xi) || length(Fs) ~= length(xi)
    error('El sistema de ecuaciones debe ser cuadrado, con el mismo número de variables que de ecuaciones simultáneas');
end

Fs = matlabFunction(Fs);
J = matlabFunction(J);
for k = 1:iterMax - 1
    xi(k+1,:) = xi(k,:)' - inv(J(num2cell(xi(k,:)){1:nargin(J)}))*Fs(num2cell(xi(k,:)){:})';
    ea(k+1) = norm(Fs(num2cell(xi(k,:)){:}));

    if isnan(ea(k+1))
        error('Divergencia detectada. Use otros valores iniciales');
    end

    if ea(k+1) < tol  %Si el error es menor a la tolerancia exigida, se acaba el ciclo.
        k = k + 1;
        break;
    end
end

for i = 1:length(vs)
    c{i} = char(vs(i));
endfor

Encabezado = {"#Ite.", c{:},"Error"};
Datos = num2cell([transpose(1:size(xi, 1)),xi,transpose(ea)]);
xn = xi(end,:)';
err = ea(end);
M = [Encabezado ; Datos];

% plot k vs ea
stem(1:k, ea(1:k));
endfunction