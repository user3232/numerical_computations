
% function to evaluate


sin1 = @(t) sin(t/2*1);
sin2 = @(t) sin(t/2*2);
zero = @(t) 0.*t;
ts = (0:0.01:1) * 2*2*pi;
dts =  ( 0:(1/2):(1-(1/2)) ) * 2*2*pi ;

%
%figure;
%hold 'on';
%grid 'on';
%p1 = plot(ts, -sin1(ts), 'linewidth', 2, 'color', 'red');
%scatter(dts, -sin1(dts), sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7], 'LineWidth',1.5);
%p2 = plot(ts, sin2(ts), 'linewidth', 2, 'color', 'blue');
%scatter(dts, sin2(dts), sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7], 'LineWidth',1.5);
%s0 = scatter(dts, zero(dts), sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7], 'LineWidth',1.5);
%legend([p1,p2,s0],
%"-sin(t/2*1), T = 6pi = 18.85", 
%" sin(t/2*2), T = 6pi = 9.42", 
%"Samples at dt = 4pi/2 = 2pi = 6.28",
%"location", "southoutside");
%print -dsvg SinesAliasing2p.svg; %%% zapisanie okna do pliku






sin1 = @(t) sin(t/3);
sin2 = @(t) sin(t/3*2);
sin3 = @(t) sin(t/3*3);
zero = @(t) 0.*t;
ts = (0:0.01:1) * 3*2*pi;
dts =  ( 0:(1/3):(1-(1/3)) ) * 3*2*pi ;


%figure;
%hold 'on';
%grid 'on';
%p1 = plot(ts, -sin1(ts), 'linewidth', 2, 'color', 'red');
%s1 = scatter(dts, -sin1(dts), sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7], 'LineWidth',1.5);
%p2 = plot(ts, sin2(ts), 'linewidth', 2, 'color', 'blue');
%scatter(dts, sin2(dts), sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7], 'LineWidth',1.5);
%p3 = plot(ts, sin3(ts), 'linewidth', 2, 'color', 'green');
%scatter(dts, sin3(dts), sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7], 'LineWidth',1.5);
%s0 = scatter(dts, zero(dts), sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7], 'LineWidth',1.5);
%legend([p1,p2,p3,s0],
%"-sin(t/3), T=6pi=18.85", 
%"sin(t/3*2), T=6pi=9.42", 
%"sin(t/3*3), T=2pi=6.28", 
%"Samples at dt = 6pi/3 = 6.28",
%"location", "southoutside");
%%print -dsvg SinesAliasing3p.svg; %%% zapisanie okna do pliku





sin1 = @(t) sin(t/5*1);
sin2 = @(t) sin(t/5*2);
sin3 = @(t) sin(t/5*3);
sin4 = @(t) sin(t/5*4);
sin5 = @(t) sin(t/5*5);
zero = @(t) 0.*t;
ts = (0:0.01:1) * 5*2*pi;
dts =  ( 0:(1/5):(1-(1/5)) ) * 5*2*pi ;
%
%figure;
%hold 'on';
%grid 'on';
%p1 = plot(ts, -sin1(ts), 'linewidth', 2, 'color', 'red');
%scatter(dts, -sin1(dts), sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7], 'LineWidth',1.5);
%p2 = plot(ts, -sin2(ts), 'linewidth', 2, 'color', 'blue');
%scatter(dts, -sin2(dts), sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7], 'LineWidth',1.5);
%p3 = plot(ts, sin3(ts), 'linewidth', 2, 'color', 'green');
%scatter(dts, sin3(dts), sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7], 'LineWidth',1.5);
%p4 = plot(ts, sin4(ts), 'linewidth', 2, 'color', 'magenta');
%scatter(dts, sin4(dts), sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7], 'LineWidth',1.5);
%p5 = plot(ts, sin5(ts), 'linewidth', 2, 'color', 'cyan');
%scatter(dts, sin5(dts), sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7], 'LineWidth',1.5);
%
%s0 = scatter(dts, zero(dts), sz,'MarkerEdgeColor',[0 .5 .5], 'MarkerFaceColor',[0 .7 .7], 'LineWidth',1.5);
%legend([p1,p2,p3, p4, p5,s0],
%"-sin(t/5*1), T = 10pi = 31.41", 
%"-sin(t/5*2), T = 8pi  = 25.13", 
%"-sin(t/5*3), T = 6pi  = 18.85", 
%" sin(t/5*4), T = 4pi  = 12.56", 
%" sin(t/5*5), T = 2pi  = 6.28", 
%"Samples at dt = 5*2*pi/5 = 2pi = 6.28", 
%"location", "southoutside");
%%print -dsvg SinesAliasing5p.svg; %%% zapisanie okna do pliku





% problem
% jak wygląda funkcja f(t) przedstawiona w postaci szeregu Fourier'a?
% do 5-tego elementu

f0 = @(t) 2+0*t; % w przedziale [0, 2]
f1 = @(t) sin(pi*t); % w przedziale [0, 2]
f2 = @(t) abs(t-1); % w przedziale [0, 2]
f3 = @(t) sin(t); % w przedziale [0, 2]
ts = 0:0.01:2;

%figure;
%hold 'on';
%grid 'on';
%p0 = plot(ts, f0(ts), 'linewidth', 2, 'color', 'red');
%p1 = plot(ts, f1(ts), 'linewidth', 2, 'color', 'green');
%p2 = plot(ts, f2(ts), 'linewidth', 2, 'color', 'blue');
%p3 = plot(ts, f3(ts), 'linewidth', 2, 'color', 'cyan');
%legend([p0,p1,p2,p3],
%"f_0(t) = 1,         T = [0, 2]", 
%"f_1(t) = sin(pi*t), T = [0, 2]", 
%"f_2(t) = abs(t-1),  T = [0, 2]",
%"f_3(t) = sin(t),    T = [0, 2]",
%"location", "southoutside");
%%print -dsvg ExampleFunctionsOn0to2.svg; %%% zapisanie okna do pliku


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

%figure;
%hold 'on';
%grid 'on';
%p0 = plot(ts, es0(ts), 'linewidth', 2, 'color', 'red');
%p1 = plot(ts, es1(ts), 'linewidth', 2, 'color', 'green');
%p2 = plot(ts, es2(ts), 'linewidth', 2, 'color', 'blue');
%p3 = plot(ts, es3(ts), 'linewidth', 2, 'color', 'magenta');
%p4 = plot(ts, es4(ts), 'linewidth', 2, 'color', 'cyan');
%p5 = plot(ts, es5(ts), 'linewidth', 2, 'color', 'black');
%legend([p0,p1,p2,p3,p4,p5],
%"e_s0(t) = t*0 + 1,     T = [0, 2]", 
%"e_s1(t) = sin(t*pi*1), T = [0, 2]", 
%"e_s2(t) = sin(t*pi*2), T = [0, 1]", 
%"e_s3(t) = sin(t*pi*3), T = [0, 2/3]", 
%"e_s4(t) = sin(t*pi*4), T = [0, 1/2]", 
%"e_s5(t) = sin(t*pi*5), T = [0, 2/5]", 
%"location", "southoutside");
%%print -dsvg FurierBasesOn0to2.svg; %%% zapisanie okna do pliku


% teraz obliczymy współczynniki szeregu Fourier'a dla f2:

f2a0 = quad(@(t) f2(t).*es0(t), 0, 2)/2;
f2b0 = quad(@(t) f2(t).*ec0(t), 0, 2)/2;
f2a1 = quad(@(t) f2(t).*es1(t), 0, 2);
f2b1 = quad(@(t) f2(t).*ec1(t), 0, 2);
f2a2 = quad(@(t) f2(t).*es2(t), 0, 2);
f2b2 = quad(@(t) f2(t).*ec2(t), 0, 2);
f2a3 = quad(@(t) f2(t).*es3(t), 0, 2);
f2b3 = quad(@(t) f2(t).*ec3(t), 0, 2);
f2a4 = quad(@(t) f2(t).*es4(t), 0, 2);
f2b4 = quad(@(t) f2(t).*ec4(t), 0, 2);
f2a5 = quad(@(t) f2(t).*es5(t), 0, 2);
f2b5 = quad(@(t) f2(t).*ec5(t), 0, 2);


% teraz przedstawmy funkcję w postaci szeregu Furier'a:

f2Furier0 = @(t) f2a0*es0(t) + f2b0*ec0(t);
f2Furier1 = @(t) f2a1*es1(t) + f2b1*ec1(t);
f2Furier2 = @(t) f2a2*es2(t) + f2b2*ec2(t);
f2Furier3 = @(t) f2a3*es3(t) + f2b3*ec3(t);
f2Furier4 = @(t) f2a4*es4(t) + f2b4*ec4(t);
f2Furier5 = @(t) f2a5*es5(t) + f2b5*ec5(t);


f2Furier01 = @(t) f2Furier0(t) + f2Furier1(t);
f2Furier012 = @(t) f2Furier01(t) + f2Furier2(t);
f2Furier0123 = @(t) f2Furier012(t) + f2Furier3(t);
f2Furier01234 = @(t) f2Furier0123(t) + f2Furier4(t);

f2Furier = @(t) f2Furier0(t) + f2Furier1(t) + f2Furier2(t) + f2Furier3(t) + f2Furier4(t) + f2Furier5(t);
tsts = -2:0.01:4;



%figure;
%hold 'on';
%grid 'on';
%p0 = plot(tsts, f2Furier0(tsts), 'linewidth', 2, 'color', 'yellow');
%p1 = plot(tsts, f2Furier01(tsts), 'linewidth', 2, 'color', 'magenta');
%p2 = plot(tsts, f2Furier012(tsts), 'linewidth', 2, 'color', 'red');
%p3 = plot(tsts, f2Furier0123(tsts), 'linewidth', 2, 'color', 'green');
%p4 = plot(tsts, f2Furier01234(tsts), 'linewidth', 2, 'color', 'blue');
%p5 = plot(tsts, f2Furier(tsts), 'linewidth', 2, 'color', 'black');
%p = plot(ts, f2(ts), 'linewidth', 4, 'color', 'red');
%legend([p,p0,p1,p2,p3,p4,p5],
%%legend([p,p1,p3,p5],
%"f_2(t) = |t-1|, Dziedzina = [0, 2], T = [0, 2]", 
%"f_2(t) = a_0/2, Dziedzina = R, T = [0, 2]", 
%"f_2(t) = a_0/2 + a_1 sin(t*pi) + b_1 cos(t*pi), Dziedzina = R, T = [0, 2]", 
%"f_2(t) = ... + a_2 sin(t*pi*2) + b_2 cos(t*pi*2), Dziedzina = R, T = [0, 2]", 
%"f_2(t) = ... + a_3 sin(t*pi*3) + b_3 cos(t*pi*3), Dziedzina = R, T = [0, 2]", 
%"f_2(t) = ... + a_4 sin(t*pi*4) + b_4 cos(t*pi*4), Dziedzina = R, T = [0, 2]", 
%"f_2(t) = a_0/2 + a_1 sin(t*pi) + b_1 cos(t*pi) + ... + a_5 sin(t*pi*5) + b_5 cos(t*pi*5), Dziedzina = R, T = [0, 2]", 
%"location", "southoutside");
%xlabel('Czas [s]');
%ylabel('Wartości [V]');
%%print -dsvg FurierSeries.svg; %%% zapisanie okna do pliku








% teraz obliczymy współczynniki szeregu Fourier'a dla f3:

f3a0 = quad(@(t) f3(t).*es0(t), 0, 2)/2
f3b0 = quad(@(t) f3(t).*ec0(t), 0, 2)/2
f3a1 = quad(@(t) f3(t).*es1(t), 0, 2)
f3b1 = quad(@(t) f3(t).*ec1(t), 0, 2)
f3a2 = quad(@(t) f3(t).*es2(t), 0, 2)
f3b2 = quad(@(t) f3(t).*ec2(t), 0, 2)
f3a3 = quad(@(t) f3(t).*es3(t), 0, 2)
f3b3 = quad(@(t) f3(t).*ec3(t), 0, 2)
f3a4 = quad(@(t) f3(t).*es4(t), 0, 2)
f3b4 = quad(@(t) f3(t).*ec4(t), 0, 2)
f3a5 = quad(@(t) f3(t).*es5(t), 0, 2)
f3b5 = quad(@(t) f3(t).*ec5(t), 0, 2)


% teraz przedstawmy funkcję w postaci szeregu Furier'a:

f3Furier0 = @(t) f3a0*es0(t) + f3b0*ec0(t);
f3Furier1 = @(t) f3a1*es1(t) + f3b1*ec1(t);
f3Furier2 = @(t) f3a2*es2(t) + f3b2*ec2(t);
f3Furier3 = @(t) f3a3*es3(t) + f3b3*ec3(t);
f3Furier4 = @(t) f3a4*es4(t) + f3b4*ec4(t);
f3Furier5 = @(t) f3a5*es5(t) + f3b5*ec5(t);


f3Furier01 = @(t) f3Furier0(t) + f3Furier1(t);
f3Furier012 = @(t) f3Furier01(t) + f3Furier2(t);
f3Furier0123 = @(t) f3Furier012(t) + f3Furier3(t);
f3Furier01234 = @(t) f3Furier0123(t) + f3Furier4(t);

f3Furier = @(t) f3Furier0(t) + f3Furier1(t) + f3Furier2(t) + f3Furier3(t) + f3Furier4(t) + f3Furier5(t);
tsts = -2:0.01:4;



%figure;
%hold 'on';
%grid 'on';
%subplot(2,3,1);
%hold 'on';
%grid 'on';
%p0a = plot(tsts, tsts*0, 'linewidth', 2, 'color', 'white');
%p0 = plot(tsts, f3Furier0(tsts), 'linewidth', 2, 'color', 'yellow');
%p = plot(ts, f3(ts), 'linewidth', 4, 'color', 'red');
%legend([p0a,p0,p], 
%"",
%"F_0(f_3)", 
%"f_3(t) = sin(t)",
%"location", "southoutside");
%xlabel('Czas [s]');
%ylabel('Wartości [V]');
%subplot(2,3,2);
%hold 'on';
%grid 'on';
%p0 = plot(tsts, f3Furier0(tsts), 'linewidth', 2, 'color', 'yellow');
%p1 = plot(tsts, f3Furier01(tsts), 'linewidth', 3, 'color', 'magenta');
%p = plot(ts, f3(ts), 'linewidth', 4, 'color', 'red');
%legend([p0,p1,p], 
%"F_0(f_3)", 
%"F_0(f_3) + F_1(f_3)",
%"f_3(t) = sin(t)",
%"location", "southoutside");
%xlabel('Czas [s]');
%ylabel('Wartości [V]');
%subplot(2,3,3);
%hold 'on';
%grid 'on';
%p1 = plot(tsts, f3Furier01(tsts), 'linewidth', 2, 'color', 'magenta');
%p2 = plot(tsts, f3Furier012(tsts), 'linewidth', 3, 'color', 'red');
%p = plot(ts, f3(ts), 'linewidth', 4, 'color', 'red');
%legend([p1,p2,p], 
%"F_0(f_3) + F_1(f_3)",
%"F_0_1(f_3) + F_2(f_3)",
%"f_3(t) = sin(t)",
%"location", "southoutside");
%xlabel('Czas [s]');
%ylabel('Wartości [V]');
%subplot(2,3,4);
%hold 'on';
%grid 'on';
%p2 = plot(tsts, f3Furier012(tsts), 'linewidth', 2, 'color', 'red');
%p3 = plot(tsts, f3Furier0123(tsts), 'linewidth', 3, 'color', 'green');
%p = plot(ts, f3(ts), 'linewidth', 4, 'color', 'red');
%legend([p2,p3,p], 
%"F_0_1(f_3) + F_2(f_3)",
%"F_0_1_2(f_3) + F_3(f_3)",
%"f_3(t) = sin(t)",
%"location", "southoutside");
%xlabel('Czas [s]');
%ylabel('Wartości [V]');
%subplot(2,3,5);
%hold 'on';
%grid 'on';
%p3 = plot(tsts, f3Furier0123(tsts), 'linewidth', 2, 'color', 'green');
%p4 = plot(tsts, f3Furier01234(tsts), 'linewidth', 3, 'color', 'blue');
%p = plot(ts, f3(ts), 'linewidth', 4, 'color', 'red');
%legend([p3,p4,p], 
%"F_0_1_2(f_3) + F_3(f_3)",
%"F_0_1_2_3(f_3) + F_4(f_3)",
%"f_3(t) = sin(t)",
%"location", "southoutside");
%xlabel('Czas [s]');
%ylabel('Wartości [V]');
%subplot(2,3,6);
%hold 'on';
%grid 'on';
%p4 = plot(tsts, f3Furier01234(tsts), 'linewidth', 2, 'color', 'blue');
%p5 = plot(tsts, f3Furier(tsts), 'linewidth', 4, 'color', 'black');
%p = plot(ts, f3(ts), 'linewidth', 4, 'color', 'red');
%legend([p3,p4,p], 
%"F_0_1_2_3(f_3) + F_4(f_3)",
%"F_0_1_2_3_4(f_3) + F_5(f_3)",
%"f_3(t) = sin(t)",
%"location", "southoutside");
%xlabel('Czas [s]');
%ylabel('Wartości [V]');
%%print -dsvg FurierSeriesCumulative.svg; %%% zapisanie okna do pliku










% plots


% computing machines: parrallel

% computing machines: serial

