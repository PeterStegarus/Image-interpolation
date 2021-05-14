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

  if x1 > m
    x1 = m;
  endif
  if x2 > m
    x2 = m;
  endif
  if y1 > n
    y1 = n;
  endif
  if y2 > n
    y2 = n;
  endif

endfunction