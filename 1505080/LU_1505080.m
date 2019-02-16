%1505080 Offline 2 B1 LU Decomposition Funcion

function X =  LU_1505080( A, B )

    [m,n] = size(A);
    [p,q] = size(B) ;    
    X = ones(p,q);    
    L = zeros(m,m);
   
    
    %Not Square of B matrix does not match
    if m~=n || m~=p
        disp('Invalid Input')
        return
    end
    
    %Invalid Equation
    minsInRows = min(A, [], 2);
    maxsInRows = max(A, [], 2) ;   
    for i = 1 : m
        if( minsInRows(i,1) == 0 &&  maxsInRows(i,1) == 0 )
            disp('Not Solvable')
            return
        end
    end
    
    %For ill conditioned Systems 
    for i = 1 : m
        for j = 1 : m
           if (A(i,j) > -0.5 && A (i,j) < 0.5 && A (i,j)~=0 )
               denom = A(i,j);
               B(i,1) = B (i,1) / denom;              
               for k = 1 : m
                    A(i,k) = A(i,k) / denom;
               end               
           end          
        end
        
        if (B(i,1) > -0.5 && B(i,1) < 0.5 && B(i,1)~=0 )
               denom = B(i,1);
               B(i,1) = B (i,1) / denom;              
               for k = 1 : m
                    A(i,k) = A(i,k) / denom;
               end               
         end
        
    end 


    A;
    B;
    
    U  = A;
    
   %Forward Elimination
   for i = 1 : m-1
            %pivoting
            maxVal = abs(U(i,i));
            rowIdx = i;
            for l = i+1 : m
               if(abs(U(l,i) ) > maxVal)
                  maxVal = abs(U(l,i) );
                  rowIdx = l;
               end
            end
            
            if(U(rowIdx,rowIdx) == 0)
                disp('Not Solvable')
                return
            end
       
            temp = B(rowIdx, 1);
            B(rowIdx, 1) = B(i,1);
            B(i,1) = temp;
            for j = 1 : m
                temp = U(rowIdx, j);
                U(rowIdx, j) = U(i,j);
                U(i,j) = temp;
                
                temp = L(rowIdx, j);
                L(rowIdx, j) = L(i,j);
                L(i,j) = temp;
                
                
            end
            %pivoting ends
       
       denom = U (i,i);      
       for j = i+1 : m
           numer = U(j,i);
           L(j,i) = numer/ denom;
            U(j,i)=0;
            %B(j,1) = B(j,1) - B(i,1) * numer/denom;
            for k = i+1 : m
                temp = U(j,k)- U(i,k) * numer/denom;
                U(j,k) = temp;
            
            end
      
       end
       
   end
   
   %disp('After Forward Elimination : ')
   L;
   U;
   B;
   
   if(U(m,m)== 0)
        disp('Invalid Set of Equations')
        return
   end
   
   for i = 1 : m
     L(i,i) = 1;       
       
   end
    
    
    %Back Substitution
    d=B;
    for i = 2 : m
       for j = 1 : i-1
          d(i,1) = d(i,1) - d(j,1) * L (i,j); 
       end
    end
    
    d;
    
    X(m,1) = d(m,1) / U (m,m);
    
    for i = m-1: -1 : 1
        temp =  d(i);
        for j = i + 1 : m
            temp = temp - X(j,1) * U (i, j);
       
        end
       
        X(i,1) = temp / U (i,i);
       
        
    end
    
    %disp('After Back Substitution : ')
    
    L;
    U;
    B;
    d;




end


