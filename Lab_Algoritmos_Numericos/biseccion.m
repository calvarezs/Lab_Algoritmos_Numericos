%Funcion biseccion

%Parametros de entrada
    %Cota superior -> a
    %Cota inferior -> b
    %Funcion a evaluar -> func 
    %Numero maximo de iteraciones -> iter
%Parametros de Salida
    %Resultados por iteracion -> resultado
    %Error por iteracion -> error
    %Tiempo acumulado de ejecucion por iteracion -> tiempo
    %Numero acumulado de instrucciones ejecutadas -> nInstrucciones
function[resultado,error,tiempo,nInstrucciones] = biseccion(a,b,func,iter) 
    nInstrucciones = 0;
    tiempo = 0;
    resultado(1) = b;
    error(1) = 1;
    iteracionesMinimas = 10;
    %En caso de que la función no tenga raiz en el intervalo dado salir
    if(sign(func(a)) == sign(func(b)))
        disp('La función no tiene raiz con los parametros dados')
        return
    end
    %Para el caso especial de que sea raiz alguno de los limites de
    %intervalos
    if(func(a) == 0)
        disp('El resultado es ' + a)
        return
    end
    if(func(b) == 0)
        disp('El resultado es ' + b)
        return
    end
     
    %inicio de iter
    timer_bisecc = tic;
    for i=1:(iter-1)
        c = (a+b)/2;
        resultado(i+1) = c;
        error(i+1) = abs((resultado(i) - c)/c);
        
        %Si el error absoluto es menor a la tolerancia, entregar c como raiz
        if(i>iteracionesMinimas && var(error(end-iteracionesMinimas:end)) == 0)
            if(tiempo == 0)
                tiempo = toc(timer_bisecc);
            end
            a=c;
            b=c;
            return;
        else
            nInstrucciones = nInstrucciones + 3;
        end
        % Si a y c tienen el mismo signo, entonces c será el nuevo valor de
        % c, sino se deduce que son b y c los valores de igual signo
        if(sign(func(a)) == sign(func(c)))
            a = c;  
        else
            b = c; 
        end
    end
    return
end