f3 = @(t) sin(t); % w przedziale [0, 2]
ts = (0: T_d: 1-T_d) * 2;
ts_full = (0: T_d: 1) * 2;
tsts = (0: 0.01: 2);

figure;
set(gcf, 'Position',  [100, 100, 800, 400]);


subplot(3,2,1);
hold 'on';
grid 'on';
xlabel('Czas [s]');
ylabel('Wartości [V]');
p1 = plot(tsts, sin(tsts*pi*1), 'linewidth', 2, 'linestyle', '-', 'color', 'black');       % -|
[xs,ys]=stairs(ts_full, sin(ts_full*pi*1));
s1 = area(xs,ys, 'linewidth', 2, 'linestyle', '-', 'FaceColor', 'magenta');       % -|
legend([p1,s1], 'sin(t*pi)', 'sin(n*dt*pi)', 'location', 'southwest');

subplot(3,2,4);
hold 'on';
grid 'on';
xlabel('Czas [s]');
ylabel('Wartości [V]');
p2 = plot(tsts, -sin(tsts*pi*2), 'linewidth', 2, 'linestyle', '-', 'color', 'black');       % -|
[xs,ys]=stairs(ts_full, -sin(ts_full*pi*2));
s2 = area(xs,ys, 'linewidth', 2, 'linestyle', '-', 'FaceColor', 'red');       % -|
legend([p2,s2], '-sin(t*pi*2)', '-sin(n*dt*pi*2)', 'location', 'southwest');


subplot(3,2,3);
hold 'on';
grid 'on';
xlabel('Czas [s]');
ylabel('Wartości [V]');
p3 = plot(tsts, sin(tsts*pi*3), 'linewidth', 2, 'linestyle', '-', 'color', 'black');       % -|
[xs,ys]=stairs(ts_full, sin(ts_full*pi*3));
s3 = area(xs,ys, 'linewidth', 2, 'linestyle', '-', 'FaceColor', 'green');       % -|
legend([p3,s3], 'sin(t*pi*3)', 'sin(n*dt*pi*3)', 'location', 'southwest');


subplot(3,2,2);
hold 'on';
grid 'on';
xlabel('Czas [s]');
ylabel('Wartości [V]');
p4 = plot(tsts, -sin(tsts*pi*4), 'linewidth', 2, 'linestyle', '-', 'color', 'black');       % -|
[xs,ys]=stairs(ts_full, -sin(ts_full*pi*4));
s4 = area(xs,ys, 'linewidth', 2, 'linestyle', '-', 'FaceColor', 'blue');       % -|
legend([p4,s4], '-sin(t*pi*4)', '-sin(n*dt*pi*4)', 'location', 'southwest');


subplot(3,2,5);
hold 'on';
grid 'on';
xlabel('Czas [s]');
ylabel('Wartości [V]');
p5 = plot(tsts, sin(tsts*pi*5), 'linewidth', 2, 'linestyle', '-', 'color', 'black');       % -|
[xs,ys]=stairs(ts_full, sin(ts_full*pi*5));
s5 = area(xs,ys, 'linewidth', 2, 'linestyle', '-', 'FaceColor', 'black');       % -|
legend([p5,s5], 'sin(t*pi*5)', 'sin(n*dt*pi*5)', 'location', 'southwest');



subplot(3,2,6);
hold 'on';
grid 'on';
xlabel('Czas [s]');
ylabel('Wartości [V]');
p0 = plot(tsts, sin(tsts*pi*0), 'linewidth', 2, 'linestyle', '-', 'color', 'black');       % -|
[xs,ys]=stairs(ts_full, sin(ts_full*pi*0));
s0 = area(xs,ys, 'linewidth', 2, 'linestyle', '-', 'FaceColor', 'yellow');       % -|
legend([p0,s0], 'sin(t*pi*0)', 'sin(n*dt*pi*0)', 'location', 'southwest');


print -dsvg SineBaseDiscretDegen.svg; %%% zapisanie okna do pliku

