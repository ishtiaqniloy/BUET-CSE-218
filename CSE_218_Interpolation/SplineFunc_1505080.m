function X = SplineFunc_1505080( fX, fY )
    
    [m,n] = size(fX);
    e = (n-1);
    s = 3 * e;
    A = zeros(s,s);
    B = zeros(s,1);
    eqn = 1;
    
    for i = 2 : n
        c = (i-2)*3 + 1;
        
        A(eqn, c) = fX(1, i) ^ 2;
        A(eqn, c+1) = fX(1, i);
        A(eqn, c+2) = 1;
        B(eqn, 1) = fY(1,i);
        eqn = eqn + 1;       
        
        A(eqn, c) = fX(1, i-1) ^ 2;
        A(eqn, c+1) = fX(1, i-1);
        A(eqn, c+2) = 1;
        B(eqn, 1) = fY(1,i-1);
        eqn = eqn + 1;
        
        if(i==n)
            break;
        end
        
        A(eqn,c) = fX(1, i) * 2;
        A(eqn,c+1) = 1;
        A(eqn,c+3) = - fX(1, i) * 2;
        A(eqn,c+4) = -1;
        eqn = eqn + 1;
        
        
    end
    
    c = s-2;
    A (eqn, c) = 1;
    
    X = LU_1505080(A, B);
    
    
end

   
    
    

