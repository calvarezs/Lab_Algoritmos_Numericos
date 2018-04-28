%Funcion secante

%Parametros de entrada
    %Primer valor inicial -> X0
    %Segundo valor inicial ->X1
    %Funcion a evaluar -> func 
    %Numero maximo de iteraciones -> iter
%Parametros de Salida
    %Resultados por iteracion -> resultado
    %Error por iteracion -> error
    %Tiempo acumulado de ejecucion por iteracion -> tiempo
    %Numero acumulado de instrucciones ejecutadas -> nInstrucciones
function[resultado,error,tiempo,nInstrucciones] = secante(X0,X1,func,iter) 
    nInstrucciones = 0;
    tiempo = 0;
    resultado(1) = X0;
    resultado(2) = X1;
    error(1) = 1;
    iteracionesMinimas = 10;  
     
    %inicio de iter
    timer_sec = tic;
    for i=2:(iter-1)
        c = resultado(i)-func(resultado(i))*(resultado(i)-resultado(i-1))/(func(resultado(i))-func(resultado(i-1)));
        resultado(i+1) = c;
        error(i+1) = abs((resultado(i) - c)/c);
        
        %Si el error absoluto es menor a la tolerancia, entregar c como raiz
        if(i>iteracionesMinimas && var(error(end-iteracionesMinimas:end)) == 0)
            if(tiempo == 0)
                tiempo = toc(timer_sec);
            end
            return;
        end
        nInstrucciones = nInstrucciones + 5; 
    end
    return
end