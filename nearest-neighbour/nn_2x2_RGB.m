function out = nn_2x2_RGB(img, STEP = 0.1)
  % =========================================================================
  % Aplica interpolare nearest neighbour pe imaginea 2x2 img cu puncte
  % intermediare echidistante.
  % img este o imagine colorata RGB.
  % =========================================================================
  
  r = img(:,:,1);
  g = img(:,:,2);
  b = img(:,:,3);
  
  outr = nn_2x2(r, STEP);
  outg = nn_2x2(g, STEP);
  outb = nn_2x2(b, STEP);
  
  out(:,:,1) = outr;
  out(:,:,2) = outg;
  out(:,:,3) = outb;
  
endfunction
