function x = Bisection_1505080( inputFunction , lowerBound, upperBound, tolerance, maxIter )
    
    prev = 0;
    for iter = 1 : maxIter
        x = (lowerBound + upperBound) / 2 ;
        
        err = (prev - x) / x * 100;
        prev = x;
        
        err = abs(err);
        
        if (err < tolerance)
            break;
        end
        
        if(inputFunction(x)* inputFunction(lowerBound) < 0 )
            upperBound = x;
        end
        
        if(inputFunction(x)* inputFunction(lowerBound) > 0 )
            lowerBound = x;
        end
        
        if(inputFunction(x)* inputFunction(lowerBound) ==  0 )
            break;
        end
    end
    
    fprintf('Iterations for Bisection Method = %i\n', iter)
            
    
    
end

