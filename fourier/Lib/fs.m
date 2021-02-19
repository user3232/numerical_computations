
% best friends:

%%%%%%%%%%%%%%%%%
% Map array: arrayfun
%%%%%%%%%%%%%%%%%
% >> arrayfun(@(x) x+10, 1:10)
% ans =
%   11   12   13   14   15   16   17   18   19   20

%%%%%%%%%%%%%%%%%
% Map cell array : cellfun
%%%%%%%%%%%%%%%%%
% >> C = {1:10, [2; 4; 6], []}
% C =
% {
%  [1,1] =
%      1    2    3    4    5    6    7    8    9   10
%  [1,2] =
%     2
%     4
%     6
%  [1,3] = [](0x0)
% }
% >> [nrows,ncols] = cellfun(@size,C)
% nrows =
%   1   3   0
% ncols =
%   10    1    0

%%%%%%%%%%%%%%%%%
% Map structure: structfun
%%%%%%%%%%%%%%%%%
% >> Struct.f1 = 1:10; Struct.f2 = [2; 4; 6];
% >> A = structfun(@mean,Struct)
% A =
%   5.5000
%   4.0000




yoyo = 1;





function c = cosTk(T, k)
  c = @(t) cos(2*pi/T*k*t);
endfunction

function s = sinTk(T, k)
  s = @(t) sin(2*pi/T*k*t);
endfunction






function a = intA0(f, T)
  a = quad(f, 0, T);
endfunction

function b = intB0(f, T)
  b = 0;
endfunction


function a = intAk(f, T, k)
  base = cosTk(T, k);
  a = quad(@(t) f(t) * base(t), 0, T);
endfunction

function b = intBk(f, T, k)
  base = sinTk(T, k);
  b = quad(@(t) f(t) * base(t), 0, T);
endfunction


function Fak = furierAk(f, T, k)
  Ak = intAk(f, T, k);
  base = cosTk(T, k);
  Fak = @(t) Ak * base(t);
endfunction

function Fbk = furierBk(f, T, k)
  Bk = intBk(f, T, k);
  base = sinTk(T, k);
  Fbk = @(t) Bk * base(t);
endfunction

function F0 = furier0(f, T)
  a0 = intA0(f, T);
  F0 = @(t) a0/2;
endfunction

function Fk = furierk(f, T, k)
  Fak = furierAk(f, T, k);
  Fbk = furierBk(f, T, k);
  Fk = @(t) Fak(t) + Fbk(t);
endfunction





function F = furier(f, T, N)
  Fks = arrayfun(@(k) furierk(f, T, k), 1 : N, 'UniformOutput', false);
  F0 = furier0(f, T);
    
  F = @(t) F0(t) + sum(cellfun(@(Fk) Fk(t), Fks, 'UniformOutput', false));
endfunction


%function res = reduce(reducer, acc, elements) 
%  res = acc;
%  for i = 1 : length(elements)
%    acc = reducer(acc, elements(i));
%  end
%  res = acc;
%endfunction

koko = furier0(@(t) sin(t), 2);

F5 = furierk(@(t) sin(t), 2, 5);
F5ys = F5(0:0.1:2)

F = furier(@(t) sin(t), 2, 3)
ff = F(0:0.1:2);
figure;
hold 'on';
grid 'on';
plot(0:0.1:2, ff);
plot(0:0.1:2, sin(0:0.1:2));


