function X = NewtonFunc_1505080( fX, fY )
    
    [m,n] = size(fX);
    table = zeros(n,n);
    
    for i = 1 : n
        table(i,1) = fY(1,i);   
    end
    
    for j = 2 : n
       for i = j : n
           table (i,j) = ( table(i,j-1)-table(i-1,  j-1) ) / ( fX(1, i)-fX (1, i-j+1)  );          
       end
    end
    
    X = zeros(1,n);
    for i = 1 : n
       X(1,i) = table(i,i); 
    end
    
end