%!test
%! f = imread("../tests/in/points1.png");
%! step = dlmread("../tests/in/points1_step.txt");
%! img = bilinear_2x2(f, step)
%! ref = dlmread("../tests/ref/bilinear/2x2_1.txt")
%! assert(max(max(abs(ref - img))) <= 5);

%!test
%! f = imread("../tests/in/points2.png");
%! step = dlmread("../tests/in/points2_step.txt");
%! img = bilinear_2x2(f, step);
%! ref = dlmread("../tests/ref/bilinear/2x2_2.txt");
%! assert(max(max(abs(ref - img))) <= 5);

%!test
%! f = imread("../tests/in/points3.png");
%! step = dlmread("../tests/in/points3_step.txt");
%! img = bilinear_2x2(f, step);
%! ref = dlmread("../tests/ref/bilinear/2x2_3.txt");
%! assert(max(max(abs(ref - img))) <= 5);
