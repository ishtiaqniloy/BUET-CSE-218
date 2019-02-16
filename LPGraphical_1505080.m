f = @(x,y) 6*x + 8*y;

Ay = @(x) (40 - 5*x )/2;
By = @(x) (60 - 6*x )/6;
Cy = @(x) (32 - 2*x )/4;
Dy = @(x) 0*x;

hold on;

fplot(Ay, [-5 20], 'r');
fplot(By, [-5 20], 'y');
fplot(Cy, [-5 20], 'b');
fplot(Dy, [-5 30], 'g');
y= -5 :1 : 30;
x = 0*y;
plot(x,y, 'k');

grid ON;
xlabel('x');
ylabel ('y');
ylim([-5 30]);
xlim ([-5 30]);
legend('5x+2y=40' , '6x+6y=60' , '2x+4y=32', 'y=0' , 'x=0');

max = 0;

A = [1 0         %eqn x=0 and y=0 
    0 1];
B = [0
    0];
X = LU_1505080(A,B);
val = f(X(1,1),X(2,1));
fprintf('Value at (%i,%i) = %i\n', X(1,1), X(2,1), val);
if(max<val)
    max=val;
end


A = [2 4       %eqn 2x+4y=32 and x=0
    1 0];
B = [32
    0];
X = LU_1505080(A,B);
val = f(X(1,1),X(2,1));
fprintf('Value at (%i,%i) = %i\n', X(1,1), X(2,1), val);
if(max<val)
    max=val;
end


A = [2 4        %eqn 6x+6y=60 and 2x+4y=32
    6 6];
B = [32
    60];
X = LU_1505080(A,B);
val = f(X(1,1),X(2,1));
fprintf('Value at (%i,%i) = %i\n', X(1,1), X(2,1), val);
if(max<val)
    max=val;
end


A = [6 6        %eqn 6x+6y=60 and 5x+2y=40
    5 2];
B = [60
    40];
X = LU_1505080(A,B);
val = f(X(1,1),X(2,1));
fprintf('Value at (%i,%i) = %i\n', X(1,1), X(2,1), val);
if(max<val)
    max=val;
end


A = [5 2        %eqn 5x+2y=40 and y=0
    0 1];
B = [40
    0];
X = LU_1505080(A,B);
val = f(X(1,1),X(2,1));
fprintf('Value at (%i,%i) = %i\n', X(1,1), X(2,1), val);
if(max<val)
    max=val;
end

fprintf('Maximized value of the function =');
disp(max);






