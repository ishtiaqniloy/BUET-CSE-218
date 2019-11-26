%z, x, y, s1, s2, s3, rhs, upperBound
arr =  [1, -6, -8, 0, 0, 0, 0, 9999999  %this large value is set to avoid its effects on minimum bound
        0, 5, 2, 1, 0, 0, 40, 0
        0, 6, 6, 0, 1, 0, 60, 0
        0, 2, 4, 0, 0, 1, 32, 0]
    
    
[minColumnArr,minColumnIdx] = min(arr,[], 2);

while(minColumnArr(1,1)<0)
    columnIdx = minColumnIdx(1,1)
    for i = 2 : 4
        arr(i,8) = arr(i,7)/arr(i,columnIdx);
    end
    
    arr
    
    [minRowArr,minRowIdx] = min(arr,[], 1);
    rowIdx = minRowIdx(1,8)
    val = arr(rowIdx,columnIdx);
    for i = 1 : 7
       arr(rowIdx, i) = arr(rowIdx, i) /  val;
    end
    
    for i = 1 : 4
        if(i==rowIdx)
            continue
        end
        val = arr(i, columnIdx);
        for j = 1 : 7
           arr( i,j) = arr(i,j) - val* arr(rowIdx, j);
            
        end
    
    
    end
    
    arr
    [minColumnArr,minColumnIdx] = min(arr,[], 2);

    
end



fprintf('Maximized value of the function =');
disp(arr(1,7));

    
 
    
    
    
    