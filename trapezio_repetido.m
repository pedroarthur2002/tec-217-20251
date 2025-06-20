function I = trapezio_repetido(f,a,b,n)
  h = (b - a)/n;
  soma = 0;

  for i = 1:n-1
    x_i = a + i*h;
    soma += f(x_i);
  endfor

  I = h/2 * (f(a) + 2*soma + f(b));

endfunction
