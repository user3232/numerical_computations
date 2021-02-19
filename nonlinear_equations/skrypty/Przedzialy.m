% Przedzialy.m
% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Przedziały zakończone przeciwnymi znakami
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = @(x) x.^2;       %%%% Definicja funkcji anonimowej
g = @(x) x.*0.5 + 1; %%%% Definicja funkcji anonimowej
zero = @(x) x.*0;
figure;     %%%% nowe okno na wykresy
hold "on";  %%%% operacje na wykresie nie będą tworzyły nowych okien
x = -2:0.05:2; %%%% generowanie wektora z elementami od -5 do 5 z krokiem 0.1
plot(x,f(x) - g(x), "-ob;x^2-0.5 x - 1;", 'LineWidth', 2);       %%% wyrysowanie wektorów x i f(x) - g(x)
plot(x,zero(x), "-k;0;", 'LineWidth', 2);       %%% wyrysowanie x-> 0
xlabel("x");  %%% nazwa osi x ma być x
ylabel("y");  %%% nazwa osi y ma być y
title("Część wspólna z 0"); %%% ustawienie tytułu wykresu
grid "on"; %%% wyświetlenie siatki
line([-2, 1],[2.5,2.5], "linestyle", "-", "color", "r", "linewidth", 4);
line([-2, 0],[2,2], "linestyle", "-", "color", "r", "linewidth", 4);
line([0, 1],[2,2], "linestyle", ":", "color", "g", "linewidth", 4);
line([-2, -0.5],[1.5,1.5], "linestyle", "-", "color", "r", "linewidth", 4);
line([-0.5, 0],[1.5,1.5], "linestyle", ":", "color", "g", "linewidth", 4);
line([-1.5, -0.5],[1,1], "linestyle", "-", "color", "r", "linewidth", 4);
line([-2, -1.5],[1,1], "linestyle", ":", "color", "g", "linewidth", 4);
line([-1, -0.5],[0.5,0.5], "linestyle", "-", "color", "r", "linewidth", 4);
line([-1.5, -1],[0.5,0.5], "linestyle", ":", "color", "g", "linewidth", 4);
line([-0.78, -0.78],[-0.5,0.5], "linestyle", "-", "color", "k", "linewidth", 2);
print -dsvg Intervals.svg; %%% zapisanie okna do pliku