

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Przecięcie się wykresów jako część wspólna zbiorów
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = @(x) x.^2;       %%%% Definicja funkcji anonimowej
g = @(x) x.*0.5 + 1; %%%% Definicja funkcji anonimowej
figure;     %%%% nowe okno na wykresy
hold "on";  %%%% operacje na wykresie nie będą tworzyły nowych okien
x = -5:0.1:5; %%%% generowanie wektora z elementami od -5 do 5 z krokiem 0.1
% wyrysowanie funkcji f(x) dla x zadanych powyżej
% "-or;x^2;" to format wykresu: 
% - linia ma być ciągła, 
% o z punktami w kształcie okręgu,
% ;x^2; z opisem w legendzie x^2
% 'LineWidth', 2 : grubość lini ma być 2
plot(x,f(x), "-or;x^2;", 'LineWidth', 2);       %%% wyrysowanie wektorów x i f(x) 
plot(x, g(x), "-ob;0.5 x + 1;", 'LineWidth', 2);%%% wyrysowanie wektorów x i g(x) 
xlabel("x");  %%% nazwa osi x ma być x
ylabel("y");  %%% nazwa osi y ma być y
title("Część wspólna zbiorów"); %%% ustawienie tytułu wykresu
grid "on"; %%% wyświetlenie siatki
% zapisanie okna do pliku:
% -dsvg (formatem wyjściowym ma być svg)
% CommonPoints.svg (nazwą pliku ma być CommonPoints.svg)
%print -dsvg CommonPoints.svg; %%% zapisanie okna do pliku

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Przecięcie się wykresu z osią X
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
print -dsvg ZerosOfEquation.svg; %%% zapisanie okna do pliku



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Metoda powiększeń
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = @(x) x.^2;       %%%% Definicja funkcji anonimowej
g = @(x) x.*0.5 + 1; %%%% Definicja funkcji anonimowej
figure; %%% nowe okno na wykresy
subplot(2,2,1); %%% siatka wykresów 2x2 i wybranie 1
xlabel("x"); %%% nazwa osi x 
ylabel("y"); %%% nazwa osi y
title("Metoda graficzna, \nproblem"); % tytuł podwykresu
hold "on"; %%% nie twórz nowych okien
grid "on"; %%% wyświetl siatkę
x = -5:0.1:5; %%% generowanie wektora z elementami od -5 do 5 z krokiem 0.1
plot(x,f(x), "-or;x^2;", 'LineWidth', 2); %%% nanieś wykres x, f(x)
plot(x, g(x), "-ob;0.5 x + 1;", 'LineWidth', 2); %%% nanieś wykres x, g(x)
legend("location", "west"); %%% ustaw położenie legendy
subplot(2,2,2); %%% siatka wykresów 2x2 i wybranie 2
xlabel("x"); %%% nazwa osi x 
ylabel("y"); %%% nazwa osi y
title("Metoda graficzna, \npowiększenie od 0 do 2");
hold "on"; %%% nie twórz nowych okien
grid "on"; %%% wyświetl siatkę
x = -0:0.1:2; %%% generowanie wektora z elementami od -0 do 2 z krokiem 0.1
plot(x,f(x), "-or;x^2;", 'LineWidth', 2); %%% nanieś wykres x, f(x)
plot(x, g(x), "-ob;0.5 x + 1;", 'LineWidth', 2); %%% nanieś wykres x, g(x)
legend("location", "west"); %%% ustaw położenie legendy
subplot(2,2,3); %%% siatka wykresów 2x2 i wybranie 3
xlabel("x"); %%% nazwa osi x 
ylabel("y"); %%% nazwa osi y
title("Metoda graficzna, \npowiększenie od 1 do 1.5");
hold "on";  %%% nie twórz nowych okien
grid "on";  %%% wyświetl siatkę
x = 1:0.05:1.5; %%% generowanie wektora z elementami od 1 do 1.5 z krokiem 0.05
plot(x,f(x), "-or;x^2;", 'LineWidth', 2); %%% nanieś wykres x, f(x)
plot(x, g(x), "-ob;0.5 x + 1;", 'LineWidth', 2); %%% nanieś wykres x, g(x)
legend("location", "northwest"); %%% ustaw położenie legendy
subplot(2,2,4); %%% siatka wykresów 2x2 i wybranie 4
xlabel("x"); %%% nazwa osi x 
ylabel("y"); %%% nazwa osi y
title("Metoda graficzna, \npowiększenie od 1.26 do 1.3");
hold "on"; %%% nie twórz nowych okien
grid "on"; %%% wyświetl siatkę
x = 1.26:0.005:1.3; %%% generowanie wektora z elementami od 1.26 do 1.3 z krokiem 0.005
plot(x,f(x), "-or;x^2;", 'LineWidth', 2); %%% nanieś wykres x, f(x)
plot(x, g(x), "-ob;0.5 x + 1;", 'LineWidth', 2); %%% nanieś wykres x, g(x)
legend("location", "northwest"); %%% ustaw położenie legendy
%print -dsvg GraphicalMethod.svg %%% zapisz okno do pliku graficznego




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Wykres, który można opisać algebraicznie, natomiast którego odwrotności nie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
uninvertable = @(x) x.^5+x.^4+x.^3+x.^2+x.^1+1;
x = -1.5:0.05:1;
figure; %%% nowe okno na wykresy
%%% nanieś wykres x, uninvertable(x)
plot(x,uninvertable(x), "-or;x^5+x^4+x^3+x^2+x^1+1;", 'LineWidth', 2);
xlabel("x"); %%% nazwa osi x 
ylabel("y"); %%% nazwa osi y
title("Funkcja bez odwrotności operatora w postaci algebraicznej");
grid "on"; %%% wyświetl siatkę
%print -dsvg NoAlgebraicInverse.svg %%% zapisz okno do pliku graficznego


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Przedział w którym wykresy muszą się przeciąć
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = @(x) x.^2;       %%%% Definicja funkcji anonimowej
g = @(x) x.*0.5 + 1; %%%% Definicja funkcji anonimowej
figure;     %%%% nowe okno na wykresy
hold "on";  %%%% operacje na wykresie nie będą tworzyły nowych okien
x = -0.5:0.1:2.5; %%%% generowanie wektora z elementami od -5 do 5 z krokiem 0.1
plot(x,f(x), "-or;x^2;", 'LineWidth', 2);       %%% wyrysowanie wektorów x i f(x) 
plot(x, g(x), "-ob;0.5 x + 1;", 'LineWidth', 2);%%% wyrysowanie wektorów x i g(x) 
xlabel("x");  %%% nazwa osi x ma być x
ylabel("y");  %%% nazwa osi y ma być y
title("Część wspólna zbiorów"); %%% ustawienie tytułu wykresu
grid "on"; %%% wyświetlenie siatki
ylim([-1, 5]);
line([0 0],[-1 4], "linestyle", "-", "color", "k", "linewidth", 2);
text(0, f(0) + 0.5, sprintf("(%5.3f, %5.3f)", 0, f(0)));
text(0, g(0) + 0.5, sprintf("(%5.3f, %5.3f)", 0, g(0)));
line([1.75 1.75],[-1 4], "linestyle", "-", "color", "k", "linewidth", 2);
text(1.75, f(1.75) + 0.5, sprintf("(%5.3f, %5.3f)", 1.75, f(1.75)));
text(1.75, g(1.75) + 0.5, sprintf("(%5.3f, %5.3f)", 1.75, g(1.75)));
print -dsvg ZeroBetween.svg; %%% zapisanie okna do pliku
