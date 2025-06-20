function I = simpson13_simples(f,a,b)
  h = (b - a)/2;
  x_1 = a + h;

  I = h/3 * (f(a) + 4*f(x_1) + f(b));
endfunction
