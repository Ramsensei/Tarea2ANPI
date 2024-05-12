function [xk,k,eabs] = parte1_p2(A,b,xk,iterMax,tol)
% Variables de entrada:

% A = matriz cuadrada de coeficientes del sistema de ecuaciones.
% b = Vector columna de resultados de cada ecuación.
% xk = Valores iniciales para cada variable.
% iterMax = Número de iteraciones
% tol = Error estimado absoluto (tolerancia).


% Variables de salida:

% xk = Resultados del sistema tras la convergencia.
% k = Número de iteraciones realizadas.
% eabs = Error absoluto final después de la iteración

if nargin < 5
    error('Insuficientes datos de entrada. Lea las instrucciones del código para más información');
else
    if size(A,1) ~= size(A,2)
        error('Se necesita que la matriz A sea cuadrada')
    elseif size(b,2) ~= 1
        error('b debe ser un vector columna');
    elseif size(A,1) ~= size(b,1)
        error('El número de filas de A no coincide con el de b. Sistema inconsistente');
    elseif size(A,1) ~= length(xk)
        error('Se debe ingresar un valor inicial para cada variable del sistema');
    elseif size(xk,2) ~= 1
        xk = transpose(xk);
    elseif det(A) == 0
        error('El determinante de la matriz A es cero, el sistema posee infinitas o ninguna solución');
    endif
endif

n = length(b);
xk1 = zeros(n,1);
for k = 1:iterMax
    for i = 1:n
        xk1(i) = (1/A(i,i))*(b(i) - A(i,:)*xk + A(i,i)*xk(i));
    endfor
    xk = xk1;
    eabs = norm(A*xk - b);
    if eabs < tol
        k = k+1;
        break;
    endif
endfor

endfunction