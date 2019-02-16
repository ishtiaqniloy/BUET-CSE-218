TrainingPointsX = [5, 6.3333, 7.6667, 9, 10.3333, 11.6667, 13];
TrainingPointsY = [-1.6352, 2.1058667, 2.2117333, 0.5, -1.2117333, -1.1058667, 2.6352];
TestPointsX = [5.6667, 9.6667, 12.3333];
TestPointsY = [0.8033333, -0.4694667, 0.1966667];


figure('name' , 'Quadratic Splines Interpolating Algorithm' );
scatter(TrainingPointsX, TrainingPointsY, 'x');
hold on;
grid on;
scatter(TestPointsX, TestPointsY, 'r');
hold off;
xlabel('X');
ylabel('Y');
xlim([5, 13]);
ylim([-2, 3]);

% fX = [3, 4.5, 7, 9]
% fY = [2.5, 1, 2.5, 0.5];
% X = SplineFunc_1505080( fX, fY )
% f = @ (x) SplineVal_1505080 (X , fX , x);
% fplot(f , [3, 9] );
  

[m,n] = size (TrainingPointsX);
avgErr = zeros (1, n-1);

for i = 2 : n
    fX = zeros(1,i);
    fY = zeros (1,i);
    
    fX(1,1) =  TrainingPointsX(1,1);
    fY(1,1) =  TrainingPointsY(1,1);
    
    d = (n-1)/(i-1);
    
    for j = 1 : i-1
        n = floor(j*d+1);
        fX(1,j+1) =  TrainingPointsX(1,n);
        fY(1,j+1) =  TrainingPointsY(1,n);
    end
    
    pause(5);
    
    X = SplineFunc_1505080( fX, fY );
    f = @ (x) SplineVal_1505080 (X , fX , x);
    
    fplot(f , [5, 13] );
    hold on;
    grid on;
    scatter(TestPointsX, TestPointsY, 'r');
    scatter(fX, fY, 'x');
    hold off;
    xlabel('X');
     ylabel('Y');
     xlim([5, 13]);
    
    err = Error_1505080(TestPointsX, TestPointsY, f)
    avgErr(1,i-1) = err;
    
end
% 
% figure ( 'position',  [100, 100, 500, 500], 'name' , 'Average Error Graph' );
% errX = 2 : 1 : n;
% plot (errX, avgErr);
% grid on;
% ylim( [-10, 800] );
% xlabel('Number of Points Taken');
% ylabel('Average Percentage of Error');


