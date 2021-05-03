function [x1 y1 x2 y2] = surrounding_points(m, n, x, y)
  % =========================================================================
  % Calculeaza cele 4 puncte ce contin in interior (x, y)
  % Primeste si dimensiunea unei imagini m x n, pentru a asigura ca nu se
  % iese din matrice.
  % =========================================================================
  
  % TODO: Calculeaza x1, y1, x2, y2
  x1 = floor(x);
  x2 = ceil(x);
  y1 = floor(y);
  y2 = ceil(y);
  % TODO: daca y se afla pe ultima linie, asigura ca y2 nu o sa iasa din
  % matrice (nu o sa fie m + 1 daca y1 = m)
  
  % TODO: analog daca x se afla pe ultima coloana
  
  if x > m
    x = m;
  endif
  if y > n
    y = n;
  endif
  endfunction