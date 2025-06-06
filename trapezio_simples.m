function integral = trapezio_simples(f,a,b):
  % Calcula a integral de f no intervalo [a,b] com a regrado trapézio simples
  
  h = b - a;
  integral = (h/2)*(f(a) + f(b));
endfunction