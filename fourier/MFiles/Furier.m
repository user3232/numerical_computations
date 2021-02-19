
xs = (0:0.1:1); 


dfs5 = @(x, fa) imag(fa(1))*sin(2*pi*0*x) + real(fa(1))*cos(2*pi*0*x) + imag(fa(2))*sin(2*pi*1*x) + real(fa(2))*cos(2*pi*1*x) + imag(fa(3))*sin(2*pi*2*x) + real(fa(3))*cos(2*pi*2*x) + imag(fa(4))*sin(2*pi*3*x) + real(fa(4))*cos(2*pi*3*x) + imag(fa(5))*sin(2*pi*4*x) + real(fa(5))*cos(2*pi*4*x);



function res = discreteFurier (xs)
  res = 0;
  for n = 0:1:nPoints
    res = res + sin(2*pi*n*x);
  end
  res;
endfunction

function res = fserie(x, fftx)
  res = 0;
  nPoints = length(fftx);
  for n = 1:1:nPoints
    n
    res = res + real(fftx(1,n)) .* (cos(2*pi*(n-1)*x)) + imag(fftx(1,n)) .* sin(2*pi*(n-1)*x);
  end
  res;
endfunction

function res = fourier(x, fxfft)
  dff = fxfft(1:length(fxfft)/2-1) ;
  dff = fxfft;
  nPoints = length(dff);
  sines = zeros(nPoints, length(x));
  cosines = zeros(nPoints, length(x));
  for n = 0:1:nPoints-1
    n;
    i = n+1;
    sines(i, :) = sin(2*pi*n*x);
    cosines(i, :) = cos(2*pi*n*x);
  end
  
%  for m = (round(-nPoints/2)+1):1:-1
%    m;
%    i = nPoints + m + 1;
%    sines(i,:) = sin(2*pi*m*x);
%    cosines(i,:) = cos(2*pi*m*x);
%  end
    
  res = cosines' * real(dff*2/nPoints)' +  sines' * imag(dff*2/nPoints)';
endfunction

%xsSquareFft = fft(xs.^2)


figure
plot(
  xs, sin(2*pi*xs), "linewidth", 2, 
  xs, -fourier(xs, fft(sin(2*pi*xs))), "linewidth", 2,
  (0:40)/41, -dfs5((0:40)/41, fft(sin(2*pi*((0:4)/5)))), "linewidth", 2
);
legend("x^2", "x^2 Furier", "x^2 Furier2");
figure
xs2 = 0:0.01:1;
plot(
  xs2, xs2.*(xs2-1), "linewidth", 2 ,
  xs2, fourier(xs2, fft(xs.*(xs-1))), "linewidth", 2
);
legend("x^2", "x^2 Furier", "x^2 Furier2");
