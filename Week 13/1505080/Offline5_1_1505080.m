trueVal = 25.83333333333333;
es =  1;
err = 100;
f = @(x) (2*x + 3/x)^2;
lo = 1;
hi = 2;
maxIter = 8;

arr = zeros(8,8);
n = 1;

arr(1,1) = trap1505080(f,lo,hi,n);
iter = 0;

while iter < maxIter
   iter = iter + 1;
   n = 2 ^ iter;
   arr(iter+1,1) = trap1505080(f,lo,hi,n);
   
   for k = 2 : iter+1
      j = 2+iter-k;
      m = 4^(k-1);
      arr(j,k) = ( m * arr(j+1, k-1) - arr(j,k-1) ) / (m-1);
   end
   
   err = abs ( (trueVal - arr(j,k) ) / trueVal) * 100;
   if(err < es)   
    fprintf('Error = %i%%, after %i iterations\n', err, iter);       
    break;
   end
    
end

fprintf('Value of Integration = %i\n', arr(j,k));

