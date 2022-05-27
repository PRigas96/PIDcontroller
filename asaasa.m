syms   x wn z s

y_up = poly2sym(wn,s);
y_down = poly2sym([1 2*z*wn wn^2],s);
y = [ y_up y_down];