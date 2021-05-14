
function R = bilinear_rotate(I, rotation_angle)
  % =========================================================================
  % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul
  % rotation_angle, aplicand interpolare biliniara.
  % rotation_angle este exprimat in radiani.
  % =========================================================================
  
  [m n nr_colors] = size(I);
  
  I = double(I);
  
  % daca imaginea e alb negru, ignora
  if nr_colors > 1
    R = -1;
    return
  endif
  
  % Obs:
  % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
  % deplasa.
  % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
  % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
  % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
  % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!
  
  % TODO: calculeaza cos si sin de rotation_angle
  c = cos(rotation_angle);
  s = sin(rotation_angle);
  % TODO: initializeaza matricea finala
  R = zeros(m, n);
  % TODO: calculeaza matricea de transformare
  T = [c -s; s c];
  % TODO: calculeaza inversa transformarii
  r = c^2 + s^2;
  invT = [c/r s/r; -s/r c/r];
  % parcurge fiecare pixel din imagine
  % foloseste coordonate de la 0 la n - 1
  for x = 0 : m - 1
    for y = 0 : n - 1
      % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
      % x_p si y_p din spatiul imaginii initiale
      p = (T * [x y]')';
      xp = p(1);
      yp = p(2);
      % trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
      % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
      xp = xp + 1;
      yp = yp + 1;
      % TODO: daca xp sau yp se afla in afara imaginii, pune un pixel
      % negru in imagine si treci mai departe
      if ((xp > m) || (xp < 1) || (yp > n) || (yp < 1))
        R(x + 1, y + 1) = 0;
        continue;
      endif
      % TODO: afla punctele ce inconjoara punctul (xp, yp)
      [xp1 yp1 xp2 yp2] = surrounding_points(m, n, xp, yp);
      % TODO: calculeaza coeficientii de interpolare a
      a = bilinear_coef(double(I'), xp1, yp1, xp2, yp2);
      % TODO: calculeaza valoarea interpolata a pixelului (x, y)
      R(x + 1, y + 1) = round([1 xp yp xp*yp] * a);
      % Obs: pentru scrierea in imagine, x si y sunt in coordonate de
      % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n
      
    endfor
  endfor
  
  % transforma matricea rezultat in uint8 pentru a fi o imagine valida
  R = uint8(R);
endfunction
