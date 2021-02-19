

f = @(x) 5.*x.^2;       %%%% Definicja funkcji anonimowej
g = @(x) x.*0.5 + 1; %%%% Definicja funkcji anonimowej
h = @(x) f(x) - g(x);%%%% Definicja funkcji anonimowej
zero = @(x) x.*0;
x = -1:0.1:0.5;

x_prev = -1;
x_curr = 0
nextSecantGuess = @(f, x_curr, x_prev) x_curr - (f(x_curr)*(x_curr - x_prev)/(f(x_curr) - f(x_prev)));
next = @(x_curr, x_prev) nextSecantGuess(h, x_curr, x_prev);
secant = @(f, x_curr, x_prev, x) (f(x_curr) .- f(x_prev))/(x_curr .- x_prev).*(x.-x_prev) .+ f(x_prev);




figure;     %%%% nowe okno na wykresy
hold "on";  %%%% operacje na wykresie nie będą tworzyły nowych okien
plot(x,h(x), "-ob;5x^2-0.5 x - 1;", 'LineWidth', 2);       %%% wyrysowanie wektorów x i f(x) - g(x)
plot(x,zero(x), "-k;0;", 'LineWidth', 2);       %%% wyrysowanie x-> 0
xlabel("x");  %%% nazwa osi x ma być x
ylabel("y");  %%% nazwa osi y ma być y
title("Algorytm siecznych"); %%% ustawienie tytułu wykresu
grid "on"; %%% wyświetlenie siatki
ylim([-1, 5]);
xlim([-1, 0.5]);


plot(x,secant(h, x_curr, x_prev, x),"linestyle", "-", "color", "r", "linewidth", 3);


x_news = next(x_curr, x_prev);
x_prev = x_curr;
x_curr = x_news
plot(x,secant(h, x_curr, x_prev, x),"linestyle", "-", "color", "r", "linewidth", 3);

x_news = next(x_curr, x_prev);
x_prev = x_curr;
x_curr = x_news
plot(x,secant(h, x_curr, x_prev, x),"linestyle", "-", "color", "r", "linewidth", 3);


x_news = next(x_curr, x_prev);
x_prev = x_curr;
x_curr = x_news
plot(x,secant(h, x_curr, x_prev, x),"linestyle", "-", "color", "r", "linewidth", 3);

print -dsvg SecantGeometry.svg; %%% zapisanie okna do pliku