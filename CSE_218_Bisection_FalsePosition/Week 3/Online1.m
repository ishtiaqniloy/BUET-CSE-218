iterations_b = zeros(1,10);
iterations_f = zeros(1,10);
k = 1  : 10;

for i = 1 : 10
    func = @(x) exp(-i * x) - 0.5;
    
    iterations_b(i) = Bisection_new(func , 0, 2, 0.05, 100);
    
    iterations_f(i) = FalsePosition_new(func , 0, 2, 0.05, 100);
    
end

iterations_b 
iterations_f 

plot(k,iterations_b , 'red' );
hold on;

plot(k,iterations_f , 'cyan' );
hold on;

xlabel('Value of k');
ylabel ('Iterations Number');
grid;
ylim([7,17]);

legend('Bisection Method','False Position Method','Location','SouthEast')


