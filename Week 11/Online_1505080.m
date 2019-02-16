func = @(x) sin(x);

%trap1505080(func, 0, pi/2);
%simpson1505080( func, -pi, 0, pi )

low = -pi/2;
up = pi;

error = 100;
trueVal = 1;
i = 1;

maxIter = 1000;

while(error >= 0.01 && i < maxIter) 
    I = 0;
    n = i*3;
    h  = (up - low) / n ;
    j = 0;
    
    while(j < n)
        I = I + trap1505080(func , low + h*j, low + h*(j+1) );
        I = I + simpson1505080(func, low + h*(j+1), low + h*(j+2), low + h*(j+3)); 
        j = j+ 3;
    end
    
    error = abs( (trueVal - I) / trueVal ) * 100;
    
    if(error < 0.01)
       fprintf('Value = %i, n = %i\n', I, n); 
       break;
    end
    
    fprintf('For n = %i, Value = %i, error = %i. To next iteration...\n', n, I, error); 

    i = i + 1;
    
end
    
    
    
