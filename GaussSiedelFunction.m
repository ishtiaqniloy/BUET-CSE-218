function X = GaussSiedelFunction( A, B )

    X = zeros(3,1);
    
    Xold = X;
    
    relErr = 0.5/100;
    maxItr = 10000;
    
    for i = 1 : maxItr
       
        X(1,1) = ( B(1,1) - A(1,2)*X(2,1) - A(1,3)*X(3,1) ) / A(1,1);
        X(2,1) = ( B(2,1) - A(2,1)*X(1,1) - A(2,3)*X(3,1) ) / A(2,2);
        X(3,1) = ( B(3,1) - A(3,2)*X(2,1) - A(3,1)*X(1,1) ) / A(3,3);
        
        sum = 0;
        for j = 1:3 
            sum = sum + abs ( ( X(j,1) - Xold(j,1)   ) / X(j,1) );
        end
        
        if( sum  < relErr)
          return 
        end
       
       Xold = X;
       
       fprintf('After %ith Iteration : \n' , i)
       
        X
        
    end




end

