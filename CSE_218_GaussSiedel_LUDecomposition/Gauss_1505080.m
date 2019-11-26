%1505080 Offline 2 B1 Gauss Elimination Function

function X = Gauss_1505080( A, B )
    [m,n] = size(A);
    [p,q] = size(B) ;    
    X = ones(p,q);
    
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
    A
    B
    
   
   %Forward Elimination
   for i = 1 : m-1
            %pivoting
            maxVal = abs(A(i,i));
            rowIdx = i;
            for l = i+1 : m
               if(abs(A(l,i) ) > maxVal)
                  maxVal = abs(A(l,i) );
                  rowIdx = l;
               end
            end
            
            if(A(rowIdx,rowIdx) == 0)
                disp('Not Solvable')
                return
            end
       
            temp = B(rowIdx, 1);
            B(rowIdx, 1) = B(i,1);
            B(i,1) = temp;
            for j = i : m
                temp = A(rowIdx, j);
                A(rowIdx, j) = A(i,j);
                A(i,j) = temp;
            end       
            %pivoting ends
       
       denom = A (i,i);      
       for j = i+1 : m
           numer = A(j,i);
            A(j,i)=0;
            B(j,1) = B(j,1) - B(i,1) * numer/denom;
            for k = i+1 : m
                temp = A(j,k)- A(i,k) * numer/denom;
                A(j,k) = temp;
            
            end
      
       end
      
   end
    
   disp('After Forward Elimination : ')
   A
   B
   
   if(A(m,m)== 0)
        disp('Invalid Set of Equations')
        return
   end
    
    %Back Substitution
    
    X(m,1) = B(m,1) / A (m,m);
    
    for i = m-1: -1 : 1
        temp =  B(i);
        for j = i + 1 : m
            temp = temp - X(j,1) * A (i, j);
       
        end
       
        X(i,1) = temp / A (i,i);
       
        
    end
    
    disp('After Back Substitution : ')
    A
    B

end

