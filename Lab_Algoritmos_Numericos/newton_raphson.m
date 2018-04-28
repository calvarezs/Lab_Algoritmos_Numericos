%Funcion biseccion

%Parametros de entrada
    %Valor Iniciale -> X0 
    %Funcion a evaluar -> func 
    %Numero maximo de iteraciones -> iter
%Parametros de Salida
    %Resultados por iteracion -> resultado
    %Error por iteracion -> error
    %Tiempo acumulado de ejecucion por iteracion -> tiempo
    %Numero acumulado de instrucciones ejecutadas-> nInstrucciones
function[resultado,error,tiempo,nInstrucciones] = newton_raphson(X0,func,iter) 
    resultado(1) = X0;
    error(1) = 1;
    tiempo = 0;
    nInstrucciones = 0;
    iteracionesMinimas = 3;
    %Para el caso especial de que sea raiz alguno de los limites de
    %intervalos
    try
        if(func(X0) == 0)
            disp('La funcion se hace cero en ' + X0)
            return;
        end
    catch 
        disp('La funcion se indetermina en ' + X0)
        return;
    end 
     
    %inicio de iter
    timer_nr = tic;
    for i=1:(iter-1)
        dfd1 = derivar_evaluar(func,resultado(i));
        c = resultado(i)-(func(resultado(i))/dfd1);
        resultado(i+1) = c;
        error(i+1) = abs((resultado(i) - c)/c);
        
        %Si el error absoluto es menor a la tolerancia, entregar c como raiz
        if(i>iteracionesMinimas && var(error(end-iteracionesMinimas:end)) == 0)
            if(tiempo == 0)
                tiempo = toc(timer_nr);
            end
            return;
        else 
            nInstrucciones = nInstrucciones + 4;
        end 
    end
    return;
end