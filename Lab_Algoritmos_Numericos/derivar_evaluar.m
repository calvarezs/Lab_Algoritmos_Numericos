%Funcion que hace una derivada (proximamente sin limit)
function resultado  = derivar_evaluar(funcion, valor)
    syms h;
    resultado = limit((funcion(valor+h)-funcion(valor))/h, h, 0);
end