f = @(x) x.^3 - x
ef = @(x) e.^(f(x))
fplot(ef, [-1.1 1.1])
hold on
fplot(f, [-1.1, 1.1])
ef9 = @(x) 9.^(f(x))
fplot(ef9, [-1.1, 1.1])

