function y = SplineVal_1505080( X , fX , x )
    [m,n] = size(fX);
    y = 0;
    
    for i = 1 : n-1
       if x >= fX(1,i ) && x <= fX(1,i+1) 
          y  =  (x .* x) .* X( (i-1).*3 + 1, 1) + x .* X( (i-1).*3 + 2, 1)  + X( (i-1).*3 + 3, 1);    
       end      
    end
    
end