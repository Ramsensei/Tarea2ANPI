function [L] = parte1_p1(p,q,m)
% Variables de entrada:

% p = Vector de tamaño m-1 que contiene los elementos de la subdiagonal inferior
% q = Vector de tamaño m-1 que contiene los elementos de la subdiagonal superior
% m = Tamaño de la matriz tridiagonal

% Variables de salida:

% L = Matriz tridiaonal de tamaño m x m

%~~~~~~~~~~~~~~~~Protección contra errores en las entradas~~~~~~~~~~~~~~~~%
if nargin != 3
    display(nargin)
    error('Insuficientes datos de entrada. Lea las instrucciones del código para más información');
else
    if length(p) != m-1 || length(q) != m-1
        error('Los vectores p y q deben tener tamaño m-1');
    elseif m < 3
        error('El tamaño de la matriz tridiagonal debe ser mayor o igual a 3');
    endif
endif

%~~~~~~~~~~~~~~~~~~~~Creación de la matriz tridiagonal~~~~~~~~~~~~~~~~~~~~%

p = [0,p];
q = [q,0];
L = zeros(m);

for i = 1:m
    L(i,i) = 2*(p(i) + q(i));
    if i < m
        L(i+1,i) = p(i+1);
        L(i,i+1) = q(i);
    endif
endfor

endfunction