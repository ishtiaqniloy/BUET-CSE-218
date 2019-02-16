function y = NewtVal_1505080( X , fX,  x )
   
    [m,n] = size(fX);
    y = X(1,1);
    
    for i = 2 : n
       temp = X(1,i);
        for j = 1 : i-1
           temp = temp .* (x - fX(1,j) );
        end
       
        y = y + temp;
    end
end