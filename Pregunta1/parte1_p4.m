%~~~~~~~~~~~~~~~~~~~~~~Inicialización de Variables~~~~~~~~~~~~~~~~~~~~~~~~%
p = [1:0.1:25];
m = 242;
A = parte1_p1(p,p,m);
b = ones(m,1);
xk = zeros(m,1);
iterMax = 1000;
tol = 1e-5;
procs = [1:nproc];
%~~~~~~~~~~~~~~~~~~~~~~~~~Comparacion de Tiempos~~~~~~~~~~~~~~~~~~~~~~~~~~%

tic
[xk1,k1,eabs1] = parte1_p2(A,b,xk,iterMax,tol);
t1 = toc;
t2 = zeros(1,length(procs));
for i = 1:length(procs)
    tic
    [xk2,k2,eabs2] = parte1_p3(A,b,xk,iterMax,tol,procs(i));
    t2(i) = toc;
endfor

%~~~~~~~~~~~~~~~~~~~~~~~~~~Imprimir Resultados~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

if xk1 == xk2 && k1 == k2 && eabs1 == eabs2
    printf('Los resultados son iguales\n');
else
    printf('Los resultados son diferentes\n');
end

printf('Tiempo de ejecución del algoritmo secuencial: %fs\n',t1);
for i = 1:length(procs)
    printf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n')
    printf('Tiempo de ejecución del algoritmo paralelo para %d procesadores: %fs\n',procs(i),t2(i));
    printf('Aceleración para %d procesadores: %f%% \n',procs(i),((t1/t2(i)) * 100));
endfor


