m = ( 5^0.5 -1 )/2;
relErr = 0.5/100;
func = @(x) -3*x^2 + 21.6*x + 5;
xl= 0;
xu = 10;

fplot(func, [0 10]);
ylim([-100 50]);
grid ON;

for i = 1 : 1000
    d  = m*(xu-xl);
    x1 =  xl+d;
    x2= xu-d;
    
    fx1 = func(x1);
    fx2 = func(x2);
    
    if(abs (xu-xl) <relErr )
        break;
        
    elseif(fx1>fx2)
        xl=x2;
    elseif(fx2>fx1)
        xu=x1;    
    
    end
end

fprintf('Maximized result =')
if(fx1>fx2)                
    disp(fx1)
else
    disp(fx2)
end

 
 