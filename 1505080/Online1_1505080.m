%z, x1, x2, x3,  s1, s2, s3, rhs, upperBound
arr =  [1, -2, 1, -2, 0, 0, 0, 0, 9999999  %this large value is set to avoid its effects on minimum bound
        0, 2, 1, 0, 1, 0, 0, 10, 0
        0, 1, 2, -2, 0, 1, 0, 20, 0
        0, 0, 1, 2, 0, 0, 1, 5, 0]
    
    
[minColumnArr,minColumnIdx] = min(arr,[], 2);
iter = 0;
while(minColumnArr(1,1)<0 && iter <5 )
    iter= iter+1;
    columnIdx = minColumnIdx(1,1)
    for i = 2 : 4
        if(arr(i,columnIdx)==0)
            arr(i,9) = 99999;
            continue;
        end
        arr(i,9) = arr(i,8)/arr(i,columnIdx);
    end
    
    arr
    
    [minRowArr,minRowIdx] = min(arr,[], 1);
    rowIdx = minRowIdx(1,9)
    val = arr(rowIdx,columnIdx);
    for i = 1 : 8
       arr(rowIdx, i) = arr(rowIdx, i) /  val;
    end
    
    for i = 1 : 4
        if(i==rowIdx)
            continue
        end
        val = arr(i, columnIdx);
        for j = 1 : 8
           arr( i,j) = arr(i,j) - val* arr(rowIdx, j);
            
        end
    
    
    end
    
    arr
    [minColumnArr,minColumnIdx] = min(arr,[], 2);

    
end



fprintf('Maximized value of the function =');
disp(arr(1,8));

    
 
    
    
    
    