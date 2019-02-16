TrainingPointsX = [-1.1, -.99, -.88,-.77, -.66, -.55, -.44, -.33, -.22, -.11, 0, .11, .22, .33, .44, .55, .66, .77, .88, .99, 1.1];
TrainingPointsY = [-4.3889490, 2.3605635, 4.5063561, 4.9975215, 4.9206573,4.5988108,4.1505193,3.6382593,3.0984539,2.5499517 , 2.000 ,1.4500483, 0.9015461,0.3617406,-0.1505310,-0.5992186, -0.9279431 ,-1.0784081,-1.1272524,-1.8334962,-5.7258890];
TestPointsX = [-1.0450 ,-0.8556 ,-0.6111 , -0.3667 , -0.1222 , 0.1222 , 0.3667 , 0.6111 ,0.8556 ,1.1000 ];
TestPointsY = [ -0.1689422 , 4.6995172 , 4.7987782 , 3.8134502 , 2.6110293 , 1.3889707 , 0.1865492 , -0.8009430, -1.1056607 , -5.7258890];

figure('name' , 'Newton Divided Difference Interpolating Algorithm' );
scatter(TrainingPointsX, TrainingPointsY, 'x');
hold on;
grid on;
scatter(TestPointsX, TestPointsY, 'r');
hold off;
xlabel('X');
ylabel('Y');
xlim([-1.2, 1.2]);
ylim([-7,7]);

[m,n] = size (TrainingPointsX);

avgErr = zeros (1, n-1);

% fX = [0, 2, 3, 4, 5];
% fY = [2, 14, 74, 242, 602];
% X = NewtonFunc_1505080( fX, fY );
% 
% f = @ (x) NewtVal_1505080 (X , fX , x);
% 
% fplot(f , [-1.1, 1.1] )


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
    
    pause(1);
    
    X = NewtonFunc_1505080( fX, fY );
    f = @ (x) NewtVal_1505080 (X , fX , x);

    fplot(f , [-1.1, 1.1] );
    hold on;
    grid on;
    scatter(TestPointsX, TestPointsY, 'r');
    scatter(TrainingPointsX, TrainingPointsY, 'x');

    
    hold off;
    xlabel('X');
    ylabel('Y');
    xlim([-1.2, 1.2]);
    ylim([-7,7]);
    
    err = Error_1505080(TestPointsX, TestPointsY, f)
    avgErr(1,i-1) = err;
    
end

figure ( 'position',  [100, 100, 500, 500], 'name' , 'Average Error Graph' );
errX = 2 : 1 : n;
plot (errX, avgErr);
grid on;
ylim( [-10, 800] );
xlabel('Number of Points Taken');
ylabel('Average Percentage of Error');

