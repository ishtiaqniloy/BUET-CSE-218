function I = trap1505080( func, a, b, n )
    h = (b-a)/n;
    
    x = a;
    s = func(a);
    
    for i = 2 : n-1
        x = x + h;
        s = s + 2 * func(x);
    end
    
    s = s + func(b);
    
    I = (b - a) * s / (2 * n);
    

end

