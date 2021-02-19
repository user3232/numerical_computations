
xs = 1:10;
xs = [1 2 3 4 5 6 7 8 9 10];

function ys = gauss(xs)

  ys = 2 .* e .^ (-1 * xs .^ 2 ./ 2);
  
end

ys = gauss(xs);
ys

function rozniczka = gauss_diff(xs) 
ysd=-2 .* xs .* e .^ (- xs .^2 ./ 2);
rozniczka=ysd;
end

ysd = gauss_diff([1 2 3 4 5 6 7 8 9 10]);
ysd