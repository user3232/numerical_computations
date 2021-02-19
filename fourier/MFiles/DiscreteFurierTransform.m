
% sprawdza względną równość skalarów z relatywną tolerancją 0.1%
almost = @(a,b) abs(a - b) < 0.001 * min(abs(a), abs(b));



% funkcja którą będziemy reprezentować w postaci dyskretnego szeregu Furier'a
f = @(t) sin(t);
% fragment tej funkcji będzie powielany, wybieramy zakres powielania (od 0 do Tf)
Tf = 2;
% funkcje bazowe Furier'a są typu t->sin(k*t) i t->cos(k*t)
% największym ich okresem będzie okres dla t->sin(t) i t->cos(t), który wynosi:
Tsin = 2*pi;

% funkcje bazowe należy przeskalować do okresu funkcji reprezentowanej,
% będzie tak jeżeli przemnożymy argumenty każdej funkcji bazowej przez liczbę:
S = Tsin/Tf;
% wybieramy na ile części dzielimy okres reprezentowanej funkcji:
N = 5;
% z powyższych parametrów ustalamy dyskretny przyrost czasu
deltat = Tf/N;
% w ten sposób momenty próbkowania będą następujące:
dts = 0: deltat : Tf-deltat;


% Zapiszmy funkcje bazowe w postaci wektorów:
% (Furier Discrete Bases for T = [0, 2])

dec0 = (dts * 0) + 1;
des0 = (dts * 0);
dec1 = cos(S*dts*1);
des1 = sin(S*dts*1);
dec2 = cos(S*dts*2);
des2 = sin(S*dts*2);
dec3 = cos(S*dts*3);
des3 = sin(S*dts*3);
dec4 = cos(S*dts*4);
des4 = sin(S*dts*4);

fdts = f(dts);


% Przechodząc do reprezentacji wektorowej, operacje na wektorach takie jak
% sumowanie czy całkowanie sprowadzają się do iloczynów skalarnych,
% gdzie przyrosty Tf/N zostały zamienione na 1.
% Np. <e1(t)|e1(t)> = Tf/2, natomiast dla wektorów <e1|e1> = N/2
% Czyli aby uzyskać wynik kompatybilny z dyskretnymi funkcjami bazowymi 
% (w formie schodkowej) należy wynik wektorowy wymnożyć przez /N * Tf .

trueIs1False0 = almost(dec1 * dec1',N/2)
dec1_dec1 = dec1 * dec1' % /N * Tf
dec1_dec2 = dec1 * dec2'
dec1_dec3 = dec1 * dec3'
dec1_dec4 = dec1 * dec4'



% Dyskretna transformacja - współczynniki:

As = [fdts*dec0', fdts*dec1', fdts*dec2', fdts*dec3', fdts*dec4']  /N * Tf
Bs = [fdts*des0', fdts*des1', fdts*des2', fdts*des3', fdts*des4']  /N * Tf
As(1) = As(1)/Tf
Bs(1) = 0

% Mając współczynniki, wyraźmy f w postaci szeregu Fourier'a

discrToCont = @(dt, fdts) @(t) fdts(floor(t/dt)+1);

ec0 = @(t) (t * 0) + 1;
es0 = @(t) (t * 0);
ec1 = @(t) cos(S*t*1);
es1 = @(t) sin(S*t*1);
ec2 = @(t) cos(S*t*2);
es2 = @(t) sin(S*t*2);
ec3 = @(t) cos(S*t*3);
es3 = @(t) sin(S*t*3);
ec4 = @(t) cos(S*t*4);
es4 = @(t) sin(S*t*4);



Fcos = @(t) As(1)*ec0(t) + As(2)*ec1(t) + As(3)*ec3(t);
Fsin = @(t) Bs(1)*es0(t) +Bs(2)*es1(t) + Bs(3)*es3(t);
F = @(t) Fcos(t) + Fsin(t);

ts = 0:0.01:2;


figure;
hold 'on';
grid 'on';
p0 = plot(ts, f(ts), 'linewidth', 4, 'linestyle', '-', 'color', 'red');
p1 = plot(ts, F(ts), 'linewidth', 2, 'linestyle', '-', 'color', 'green');

Cs = fft(fdts);
real(Cs(1))
As = real(Cs) /N * Tf;
As(1) = As(1)/2;
Bs = -imag(Cs) /N * Tf;

Fcos = @(t) As(1)*ec0(t) + As(2)*ec1(t) + As(3)*ec3(t);
Fsin = @(t) Bs(1)*es0(t) +Bs(2)*es1(t) + Bs(3)*es3(t);
F = @(t) Fcos(t) + Fsin(t);
p2 = plot(ts, F(ts) - 0.1, 'linewidth', 2, 'linestyle', '-', 'color', 'blue');



function res = furierize(Tf, Fs, t)
  N = length(Fs);
  N2 = ceil(N/2);
  res = real(Fs(1))/N*Tf/2;
  for i = 1:N2-1
    res = res + real(Fs(i+1))/N*Tf*cos(2*pi/Tf*t*i) - imag(Fs(i+1))/N*Tf*sin(2*pi/Tf*t*i);
  end
  res;
endfunction


Fs = fft(sin(0: Tf/10: Tf - Tf/10));
FFFs = furierize(Tf, Fs, 0:0.01:2);
p3 = plot(0:0.01:2, FFFs, 'linewidth', 2, 'linestyle', '-', 'color', 'magenta');

Fs = fft(sin(0: Tf/20: Tf - Tf/20));
FFFs = furierize(Tf, Fs, 0:0.01:2);
p4 = plot(0:0.01:2, FFFs, 'linewidth', 2, 'linestyle', '-', 'color', 'black');






legend([p0,p1,p2,p3,p4], 
'f(t) = sin(t)', 
'DFT(f(t), N = 3)', 
'FFT(f(t), N = 3)-0.1',
'FFT(f(t), N = 5)',
'FFT(f(t), N = 10)',
'location', 'south');

ylim([-0.5 1.5]);

print -dsvg DFTs.svg; %%% zapisanie okna do pliku










function [As, Bs] = furierSerieCoeff(Tf, f, N)
  As = zeros(1,N);
  Bs = zeros(1,N);
  res = 0;
  for n = 1 : N
    As(1,n) = quad(@(t) f(t)*cos(2*pi/Tf*t*(n-1)), 0, Tf);
    Bs(1,n) = quad(@(t) f(t)*sin(2*pi/Tf*t*(n-1)), 0, Tf);
  end
  As(1,1) = As(1,1)/2;
endfunction

function res = furierSerie(As, Bs, Tf, t)
  N = length(As);
  res = 0;
  for n = 1 : N
    res = res + As(1,n) * cos(2*pi/Tf*t*(n-1)) + Bs(1,n) * sin(2*pi/Tf*t*(n-1));
  end
  res;
endfunction



figure;
hold 'on';
grid 'on';
p0 = plot(ts, f(ts), 'linewidth', 4, 'linestyle', '-', 'color', 'red');

[As, Bs] = furierSerieCoeff(Tf, f, 3)
fs3 = @(t) furierSerie(As, Bs, Tf, t);
p1 = plot(0:0.01:2, fs3(0:0.01:2), 'linewidth', 2, 'linestyle', '-', 'color', 'green');

[As, Bs] = furierSerieCoeff(Tf, f, 5);
fs5 = @(t) furierSerie(As, Bs, Tf, t);
p2 = plot(0:0.01:2, fs5(0:0.01:2), 'linewidth', 2, 'linestyle', '-', 'color', 'magenta');

[As, Bs] = furierSerieCoeff(Tf, f, 10);
fs10 = @(t) furierSerie(As, Bs, Tf, t);
p3 = plot(0:0.01:2, fs10(0:0.01:2), 'linewidth', 2, 'linestyle', '-', 'color', 'black');

%[As, Bs] = furierSerieCoeff(Tf, f, 49);
%fs49 = @(t) furierSerie(As, Bs, Tf, t);
%p4 = plot(0:0.01:2, fs49(0:0.01:2), 'linewidth', 2, 'linestyle', '-', 'color', 'black');


legend([p0,p1,p2,p3], 
'f(t) = sin(t)', 
'FT(f(t), N = 3)', 
'FT(f(t), N = 5)',
'FT(f(t), N = 10)',
'location', 'south');
ylim([-0.5 1.5]);

print -dsvg FTs.svg; %%% zapisanie okna do pliku