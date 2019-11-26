function iter =  FalsePosition_new( inputFunction , lowerBound, upperBound, tolerance, maxIter )
    prev = 0;
    for iter = 1 : maxIter
        fl = inputFunction(lowerBound);
        fu = inputFunction(upperBound);
        
        x = ( lowerBound*fu - upperBound*fl ) / (fu - fl);
        
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
    
    fprintf('Value for False Position Method = %i\n', x)
            
    

end

