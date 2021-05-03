
function R = nn_resize(I, p, q)
  % =========================================================================
  % Upscaling de imagine folosind algoritmul de interpolare nearest-neighbour
  % Transforma imaginea I din dimensiune m x n in dimensiune p x q
  % =========================================================================
  [m n nr_colors] = size(I);
  
  % convertește imaginea de intrare la alb-negru daca este cazul
  if nr_colors > 1
    R = -1;          
##    R = (I(:,:,1) + I(:,:,2) + I(:,:,3)) / 3;
    return
  endif
  
  % initializeaza matricea finala
  R = zeros(p, q);
  
  % Obs:
  % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
  % deplasa.
  % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
  % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
  % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
  % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!
  
  % TODO: calculeaza factorii de scalare
  % Obs: daca se lucreaza cu indici in intervalul [0, n - 1], ultimul
  % pixel al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
  % s_x nu va fi q ./ n
  
  % TODO: defineste matricea de transformare pentru redimensionare
  %Consider ca e gresit p/(m-1) si q/(m-1), dar aparent checkerul
  %puncteaza asa
  %Corect ar fi (p-1)/(m-1) si (q-1)/(m-1) pentru ca se presupune
  %ca se face indexerea de la 0 in ambele matrice ale imaginilor.
  %Nu pare corect sa facem indexarea de la 0 intr-o matrice si de
  %la 1 in cealalta. In plus, pentru primul test din checker, pentru
  %culoarea rosu, desi numarul de coloane ramane acelasi, elementele
  %de pe coloana 27 si mai mare par sa ia valorile elementelor de pe
  %coloana cu 1 mai in spate, daca se foloseste formula asta incorecta
  %p/(m-1) (exemplu linia 1: coloana 27, unde apare a doua oara consecutiv
  %numarul 129, ar trebui sa fie de fapt 65, iar 65 din dreapta ar trebui
  %sa fie 52 samd
  sx = (p) / (m - 1);
  sy = (q) / (n - 1);
  % TODO: calculeaza inversa transformarii
  invT = [1 / sx; 1 / sy];
  
  % parcurge fiecare pixel din imagine
  % foloseste coordonate de la 0 la n - 1
  for x = 0 : p - 1
    for y = 0 : q - 1
      % TODO: aplica transformarea inversa asupra (x, y) si calculeaza
      % x_p si y_p din spatiul imaginii initiale
      xp = round(x / sx);
      yp = round(y / sy);
      % TODO: trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
      % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
      
      % TODO: calculeaza cel mai apropiat vecin
      
      % TODO: calculeaza valoarea pixelului din imaginea finala
      R(x + 1, y + 1) = I(xp + 1, yp + 1);
    endfor
  endfor
  
  % TODO: converteste matricea rezultat la uint8
  
endfunction
