function out = nn_resize_RGB(img, p, q)
  % =========================================================================
  % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
  % Imaginea img este colorata.
  % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
  % =========================================================================
  
  r = img(:,:,1);
  g = img(:,:,2);
  b = img(:,:,3);
  
  outr = nn_resize(r, p, q);
  outg = nn_resize(g, p, q);
  outb = nn_resize(b, p, q);
  
  out(:,:,1) = outr;
  out(:,:,2) = outg;
  out(:,:,3) = outb;
  
endfunction
