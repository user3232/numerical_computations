% Fourier2.m

yo = 1;

function res = furierSerieCoeff(N, f)
  w = 2*pi/N;
  as = zeros(N, 1);
  bs = zeros(N, 1);
  for k = 0:1:N-1
    bs(k+1, 1) = 2/N* quad(@(n) f(n)*sin(w*k*n), 0, N);
    as(k+1, 1) = 2/N* quad(@(n) f(n)*cos(w*k*n), 0, N);
  end
  res = [as, bs];
endfunction





function cs = furierDiscreteCoeff(points)
  N = length(points);
  cs = zeros(N, 1);
  for k = 0:1:N-1
    for n = 0:1:N-1
      cs(k+1, 1) = cs(k+1, 1) + (  points(n+1)*exp(-i*2*pi/N*k*n)  );
    end
  end
  cs;
endfunction


function cs = furierSerieCoeff2(N, f)
  w = 2*pi;
  cs = zeros(N, 1);
  for k = 0:1:N-1
    cs(k+1, 1) = quad(@(n) real(f(n)*exp(-i*w*k*n)), 0, 1) + i * quad(@(n) imag(f(n)*exp(-i*w*k*n)), 0, 1);
  end
endfunction

xs = 0:0.2:0.8;
%xs = 0:0.1:0.9;

sercoeff = furierSerieCoeff(5, @(x) sin(2*pi*x/5))
dftcoeff = furierDiscreteCoeff(sin(2*pi*xs))
fftcoeff = fft(sin(2*pi*xs))'

cs = furierSerieCoeff2(5, @(x) sin(2*pi*x))

