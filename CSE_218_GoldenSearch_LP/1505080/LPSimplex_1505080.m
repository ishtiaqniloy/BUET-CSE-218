%z, x, y, s1, s2, s3, rhs, upperBound
array =  [1, -6, -8, 0, 0, 0, 0, 9999999  %this large value is set to avoid its effects on minimum bound
        0, 5, 2, 1, 0, 0, 40, 0
        0, 6, 6, 0, 1, 0, 60, 0
        0, 2, 4, 0, 0, 1, 32, 0]
    
    
[minColumnArr,minColumnIdx] = min(array,[], 2);

while(minColumnArr(1,1)<0 && abs (minColumnArr(1,1)<0)>0.1)
    columnIdx = minColumnIdx(1,1)
    for i = 2 : 4
        array(i,8) = array(i,7)/array(i,columnIdx);
    end
    
    array
    
    [minRowArr,minRowIdx] = min(array,[], 1);
    rowIdx = minRowIdx(1,8)
    val = array(rowIdx,columnIdx);
    for i = 1 : 7
       array(rowIdx, i) = array(rowIdx, i) /  val;
    end
    
    for i = 1 : 4
        if(i==rowIdx)
            continue
        end
        val = array(i, columnIdx);
        for j = 1 : 7
           array( i,j) = array(i,j) - val* array(rowIdx, j);
            
        end
    
    
    end
    
    array
    [minColumnArr,minColumnIdx] = min(array,[], 2);

    
end



fprintf('Maximized value of the function =');
disp(array(1,7));

    
 
    
    
    
    