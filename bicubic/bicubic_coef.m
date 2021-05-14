function A = bicubic_coef(f, Ix, Iy, Ixy, y1, x1, y2, x2)
  % =========================================================================
  % Calculeaza coeficientii de interpolare bicubica pentru 4 puncte alaturate
  % =========================================================================
  B = [1 0 0 0; 0 0 1 0; -3 3 -2 -1; 2 -2 1 1];
  % TODO: calculeaza matricile intermediare
  C = [f(x1, y1), f(x2, y1), Iy(x1, y1), Iy(x2, y1);...
      f(x1, y2), f(x2, y2), Iy(x1, y2), Iy(x2, y2);...
      Ix(x1, y1), Ix(x2, y1), Ixy(x1, y1), Ixy(x2, y1);...
      Ix(x1, y2), Ix(x2, y2), Ixy(x1, y2), Ixy(x2, y2)];
  % TODO: converteste matricile intermediare la double
  C = double(C);
  B = double(B);
  % TODO: calculeaza matricea finala
  A = B * C * B';
  endfunction