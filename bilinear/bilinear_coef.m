function a = bilinear_coef(f, x1, y1, x2, y2)
  % =========================================================================
  % Calculeaza coeficientii a pentru interpolarea biliniara intre punctele
  % (x1, y1), (x1, y2), (x2, y1) si (x2, y2)
  % =========================================================================
  f = f';
  % TODO: calculeaza matricea A
  A = zeros(4);
  A(:,1) = 1;
  A(:,2) = [x1 x1 x2 x2]';
  A(:,3) = [y1 y2 y1 y2]';
  A(:,4) = A(:,2).*A(:,3);
  % TODO: calculeaza vectorul b
  b = [f(x1, y1); f(x1, y2); f(x2, y1); f(x2, y2)];
  % TODO: calculeaza coeficientii
##  a = ols(b,A);
  warning('off', 'all');
  a = A\b;
endfunction