

% dyskretny szereg Furier'a:

% problem
% jak wygląda funkcja f(t) przedstawiona w postaci szeregu Fourier'a?
% do 5-tego elementu

f0 = @(t) 2+0*t; % w przedziale [0, 2]
f1 = @(t) sin(pi*t); % w przedziale [0, 2]
f2 = @(t) abs(t-1); % w przedziale [0, 2]
f3 = @(t) sin(t); % w przedziale [0, 2]
ts = 0:0.1:2;
tsts = 0:0.1:2;

figure;
hold 'on';
grid 'on';
p0 = stairs(ts, f0(ts), 'linewidth', 2, 'color', 'red');
p1 = stairs(ts, f1(ts), 'linewidth', 2, 'color', 'green');
p2 = stairs(ts, f2(ts), 'linewidth', 2, 'color', 'blue');
p3 = stairs(ts, f3(ts), 'linewidth', 2, 'color', 'cyan');
p0c = plot(tsts, f0(tsts), 'linewidth', 2, 'color', 'red', 'linestyle', '--');
p1c = plot(tsts, f1(tsts), 'linewidth', 2, 'color', 'green', 'linestyle', '--');
p2c = plot(tsts, f2(tsts), 'linewidth', 2, 'color', 'blue', 'linestyle', '--');
p3c = area(tsts, f3(tsts), 'linewidth', 2, 'linestyle', '--');
%legend([p0,p1,p2,p3, p0c,p1c,p2c,p3c],
legend([p0,p1,p2,p3],
"f_0(t) = 1,         T = [0, 2], dT = 0.1", 
"f_1(t) = sin(pi*t), T = [0, 2], dT = 0.1", 
"f_2(t) = abs(t-1),  T = [0, 2], dT = 0.1",
"f_3(t) = sin(t),    T = [0, 2], dT = 0.1",
"location", "southoutside");
xlabel('Czas [s]');
ylabel('Wartości [V]');
print -dsvg FunctionsDiscretization.svg; %%% zapisanie okna do pliku








% potrzebujemy okresu podstawowego T_d, i dla N punktowego przybliżenia mamy:
% T = N*T_d, dla transformacji 5-cio punktowej dla funkcji f3 o okresie [0, 2]:

N = 5;
T_d = 1/N;
% czyli czasy w których pobieramy próbkę to:
ts = (0: T_d: 1-T_d) * 2;
ts_full = (0: T_d: 1) * 2;
tsts = 0: 0.01: 2;

figure;
set(gcf, 'Position',  [100, 100, 800, 400]);
hold 'on';
grid 'on';
[xs, ys] = stairs(ts_full, f3(ts_full));
ps = area(xs, ys, 'linewidth', 2, 'linestyle', '--', 'FaceColor', 'yellow');
pa = plot(tsts, f3(tsts), 'linewidth', 4, 'linestyle', '-', 'color', 'red');

%p0 = plot(tsts, sin(tsts*pi*0), 'linewidth', 2, 'linestyle', '-', 'color', 'black');
p1 = plot(tsts, sin(tsts*pi*1), 'linewidth', 2, 'linestyle', '-', 'color', 'magenta');       % -|
p2 = plot(tsts, sin(tsts*pi*2), 'linewidth', 2, 'linestyle', '-', 'color', 'red');    % -|
p3 = plot(tsts, -sin(tsts*pi*3), 'linewidth', 2, 'linestyle', '-', 'color', 'green');   % -|
p4 = plot(tsts, -sin(tsts*pi*4), 'linewidth', 2, 'linestyle', '-', 'color', 'blue');         % -|
%p5 = plot(tsts, sin(tsts*pi*5), 'linewidth', 2, 'linestyle', '-', 'color', 'black');

[xs, ys] = stairs(ts_full, sin(ts_full*pi*1));
p1s = area(xs, ys, 'linewidth', 2, 'linestyle', '-', 'FaceColor', 'magenta');       % -|
%p1s.FaceAlpha = 0.5;
[xs, ys] = stairs(ts_full, sin(ts_full*pi*2));
p2s = area(xs, ys, 'linewidth', 2, 'linestyle', '-', 'FaceColor', 'red');    % -|
%[xs, ys] = stairs(ts_full, sin(ts_full*pi*3));
p3s = stairs(ts_full, -sin(ts_full*pi*3), 'linewidth', 2, 'linestyle', '-', 'color', 'green');   % -|
p4s = stairs(ts_full, -sin(ts_full*pi*4), 'linewidth', 2, 'linestyle', '-', 'color', 'blue');         % -|


legend([ps,pa,p1,p2,p3,p4],
"f_3(t) w punktach dt = 2/5", 
"f_3(t) = sin(t), T = [0, 2]", 
"e_1(t) = sin(t*pi),    T = [0, 2]",
"e_2(t) = sin(t*pi*2),  T = [0, 1]",
"-e_3(t) = -sin(t*pi*3),  T = [0, 2/3]",
"-e_4(t) = -sin(t*pi*4),  T = [0, 1/2]",
"location", "eastoutside");
xlabel('Czas [s]');
ylabel('Wartości [V]');
print -dsvg DiscretizationAliasing.svg; %%% zapisanie okna do pliku






% e1(t) potrzeba aby miało okres T1 = [0,2] natomiast wiadomo że ma [0, 2*pi]
% jak należy wyskalować argument t żeby tak było? (a później wprowadzić to
% skalowanie do wnętrza e1)
% no więc efekt ma być taki: 0 -> 0, 2 -> 2*pi
% czyli jak t pomnożymy przez pi to tak będzie.
% w związku z tym funkcje bazowe będą postaci:

es0 = @(t) t*0 + 1; % sin(t*pi*0) == 1, T0 jest dowolny
ec0 = @(t) t*0;     % cos(t*pi*0) == 0, T0 jest dowolny

es1 = @(t) sin(t*pi*1); % T1 == [0, 2*pi/pi] == [0, 2]
ec1 = @(t) cos(t*pi*1); % T1 == [0, 2*pi/pi] == [0, 2]

es2 = @(t) sin(t*pi*2); % T2 == [0, 2*pi/2/pi] == [0, 1] == 1/2 * T1
ec2 = @(t) cos(t*pi*2); % T2 == [0, 2*pi/2/pi] == [0, 1] == 1/2 * T1

es3 = @(t) sin(t*pi*3); % T3 == [0, 2*pi/3/pi] == [0, 2/3] == 1/3 * T1
ec3 = @(t) cos(t*pi*3); % T3 == [0, 2*pi/3/pi] == [0, 2/3] == 1/3 * T1

es4 = @(t) sin(t*pi*4); % T4 == [0, 2*pi/4/pi] == [0, 1/2] == 1/4 * T1
ec4 = @(t) cos(t*pi*4); % T4 == [0, 2*pi/4/pi] == [0, 1/2] == 1/4 * T1

es5 = @(t) sin(t*pi*5); % T5 == [0, 2*pi/5/pi] == [0, 2/5] == 1/5 * T1
ec5 = @(t) cos(t*pi*5); % T5 == [0, 2*pi/5/pi] == [0, 2/5] == 1/5 * T1

ts = 0:0.01:2;

