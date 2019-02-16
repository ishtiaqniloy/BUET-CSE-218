function avgErr = Error_1505080( testX, testY, func )

    err = 0;
    [m,n] = size (testX);
    
    for i = 1 : n
        err=err + abs((testY(1,i)-func(testX(1,i)))/testY(1,i))*100;
    end
    avgErr = err / n ;
end

