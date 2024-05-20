function parte2_p3()
    % Ejemplos tomados para la función newton_rhapson


    % Se usa [1,1] como valor inicial, tolerancia de 1e-6 y 1000 iteraciones máximas
    xi = [1, 1];

    figure(1)
    subplot(3,2,1)
    % Ejemplo a
    f = ["exp(x1^2)-exp(sqrt(2)*x1)"; "x1 - x2"];
    [xn, k, err, M] = newton_rhapson(f,xi,1e-6,1000);
    disp("Ejemplo a")
    xn
    k
    err
    xlabel ("k");
    ylabel ("error");
    title ("Ejemplo a");

    subplot(3,2,2)
    % Ejemplo b
    f = ["x1 + exp(x2) - cos(x2)"; "3*x1 - x2 - sin(x2)"];
    [xn, k, err, M] = newton_rhapson(f,xi,1e-6,1000);
    disp("Ejemplo b")
    xn
    k
    err
    xlabel ("k");
    ylabel ("error");
    title ("Ejemplo b");

    subplot(3,2,3)
    % Ejemplo c
    f = ["x1^2 - 2*x1 - x2 + (1/2)"; "x1^2 + 4*x2^2 - 4"];
    [xn, k, err, M] = newton_rhapson(f,xi,1e-6,1000);
    disp("Ejemplo c")
    xn
    k
    err
    xlabel ("k");
    ylabel ("error");
    title ("Ejemplo c");

    subplot(3,2,4)
    % Ejemplo d
    f = ["x1^2 + x2^2 - 1"; "x1^2 - x2^2 + (1/2)"];
    [xn, k, err, M] = newton_rhapson(f,xi,1e-6,1000);
    disp("Ejemplo d")
    xn
    k
    err
    xlabel ("k");
    ylabel ("error");
    title ("Ejemplo d");

    subplot(3,2,5)
    % Ejemplo e
    f = ["sin(x1) + x2*cos(x1)"; "x1 - x2"];
    [xn, k, err, M] = newton_rhapson(f,xi,1e-6,1000);
    disp("Ejemplo e")
    xn
    k
    err
    xlabel ("k");
    ylabel ("error");
    title ("Ejemplo e");

    subplot(3,2,6)
    % Ejemplo g
    f = ["x2*x3 + x4*(x2 + x3)";
         "x1*x3 + x4*(x1 + x3)";
         "x1*x2 + x4*(x1 + x2)";
         "x1*x2 + x1*x3 + x2*x3 - 1"];
    [xn, k, err, M] = newton_rhapson(f,[1 1 1 1],1e-6,1000);
    disp("Ejemplo g")
    xn
    k
    err
    xlabel ("k");
    ylabel ("error");
    title ("Ejemplo g");
    
end
