function out = nn_2x2_RGB(img, STEP = 0.1)
  % =========================================================================
  % Aplica interpolare nearest neighbour pe imaginea 2x2 img cu puncte
  % intermediare echidistante.
  % img este o imagine colorata RGB.
  % =========================================================================
  
  % TODO: extrage canalul rosu al imaginii
  r = img(:,:,1);
  % TODO: extrage canalul verde al imaginii
  g = img(:,:,2);
  % TODO: extrace canalul albastru al imaginii
  b = img(:,:,3);
  
  % TODO: aplica functia nn pe cele 3 canale ale imaginii
  outr = nn_2x2(r, STEP);
  outg = nn_2x2(g, STEP);
  outb = nn_2x2(b, STEP);
  
  % TODO: formeaza imaginea finala cu cele 3 canale de culori
  out(:,:,1) = outr;
  out(:,:,2) = outg;
  out(:,:,3) = outb;
  % Hint: functia cat
  
endfunction
