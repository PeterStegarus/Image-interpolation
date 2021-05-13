function out = bilinear_resize_RGB(img, p, q)
  % =========================================================================
  % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
  % Imaginea img este colorata.
  % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
  % =========================================================================
  
  r = img(:,:,1);
  g = img(:,:,2);
  b = img(:,:,3);
  
  outr = bilinear_resize(r, rotation_angle);
  outg = bilinear_resize(g, rotation_angle);
  outb = bilinear_resize(b, rotation_angle);
  
  out(:,:,1) = outr;
  out(:,:,2) = outg;
  out(:,:,3) = outb;
  
  endfunction