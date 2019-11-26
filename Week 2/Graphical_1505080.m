Re = 20000;
Karman = @(f) 1/sqrt(f) - 4 .* log10 (Re .* sqrt(f) ) + 0.4


f = 0.001:0.001:0.01;
y = 1 ./ sqrt(f) - 4 .* log10 (Re .* sqrt(f) ) + 0.4;
plot(f,y);
grid;

b = Bisection_1505080(Karman , 0.001, 0.01, 0.5, 100);
fprintf('Value of f from Bisection Method = %i\n', b)

fp = FalsePosition_1505080(Karman , 0.001, 0.01, 0.5, 100);
fprintf('Value of f from False Position Method = %i\n', fp)

