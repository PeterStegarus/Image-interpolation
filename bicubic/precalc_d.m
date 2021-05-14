function [Ix, Iy, Ixy] = precalc_d(I)
  % =========================================================================
  % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
  % imaginii I pentru fiecare pixel al acesteia
  % =========================================================================
  
  % obtine dimensiunea imaginii
  [m n nr_colors] = size(I);

  I = double(I);

  for x = 1:n
    for y = 1:m
      Ix(y, x) = fx(I, x, y);
      Iy(y, x) = fy(I, x, y);
    endfor
  endfor
  for x = 1:n
    for y = 1:m
      Ixy(y, x) = fxy(Ix, x, y);
      endfor
  endfor
endfunction
