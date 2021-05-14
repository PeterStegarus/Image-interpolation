function R = bicubic_resize(I, p, q)
  % =========================================================================
  % Upscaling de imagine folosind algoritmul de interpolare bicubica
  % Transforma imaginea I din dimensiune m x n in dimensiune p x q
  % =========================================================================
  
  [m n nr_colors] = size(I);
  
  % initializeaza matricea finala
  R = zeros(p, q);
  I = double(I);
  % daca imaginea e alb negru, ignora
  if nr_colors > 1
    R = -1;
    return
  endif
  
  
  % TODO: calculeaza factorii de scalare
  sy = (p - 1) / (m - 1);
  sx = (q - 1) / (n - 1);
  % Obs: daca se lucreaza cu indici in intervalul [0, n - 1], ultimul
  % pixel al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
  % s_x nu va fi q ./ n
  
  % TODO: precalculeaza derivatele
  [Ix, Iy, Ixy] = precalc_d(I);
  % parcurge fiecare pixel din imagine
  % foloseste coordonate de la 0 la n - 1

  for y = 0 : p - 1
    for x = 0 : q - 1
      % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
      % x_p si y_p din spatiul imaginii initiale
      xp = x / sx + 1;
      yp = y / sy + 1;

      % TODO: gaseste cele 4 puncte ce inconjoara punctul x, y
      [x1 y1 x2 y2] = surrounding_points(n, m, xp, yp);
      % TODO: calculeaza coeficientii de interpolare A
      A = bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2);
      % TODO: trece coordonatele (xp, yp) in patratul unitate, scazand (x1, y1)
      xp = xp - x1;
      yp = yp - y1;
      % TODO: calculeaza valoarea interpolata a pixelului (x, y)
      R(y + 1, x + 1) = [1 xp xp^2 xp^3] * A * [1 yp yp^2 yp^3]';
      % Obs: pentru scrierea in imagine, x si y sunt in coordonate de
      % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n
      
    endfor
  endfor
  
  % TODO: transforma matricea rezultat in uint8 pentru a fi o imagine valida
  R = (uint8)(R);
endfunction