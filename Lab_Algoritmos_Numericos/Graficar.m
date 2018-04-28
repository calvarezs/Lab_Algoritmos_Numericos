function [Normalizado]  = Graficar(Arreglos,tamanos)

cantidad = length(tamanos);
y = max(tamanos);
x = linspace(1,y,y);
Normalizado = [];

for i=1:cantidad
     for j=((i-1)*y +1):(y*i)
        if j<= y*(i-1)+ tamanos(i)   
            Normalizado(end+1)=Arreglos(j - y*(i-1));
        else
           Normalizado(end+1)=Normalizado(end);
        end
     end 
end
figure;
plot(x,Normalizado(1:1:y)),hold on;
for i=2:cantidad
   plot(x,Normalizado(y*(i-1) +1:1:y*i));
end
end