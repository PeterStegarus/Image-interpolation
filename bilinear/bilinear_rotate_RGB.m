function out = bilinear_rotate_RGB(img, rotation_angle)
  % =========================================================================
  % Aplica interpolare bilineara pentru a roti o imagine RGB cu un unghi dat.
  % =========================================================================
  
  r = img(:,:,1);
  g = img(:,:,2);
  b = img(:,:,3);
  
  outr = bilinear_rotate(r, rotation_angle);
  outg = bilinear_rotate(g, rotation_angle);
  outb = bilinear_rotate(b, rotation_angle);
  
  out(:,:,1) = outr;
  out(:,:,2) = outg;
  out(:,:,3) = outb;
  
endfunction