x = -2*pi : 0.2 : 2 * pi;

figure('Name', 'Sine curves using Taylor Series', 'NumberTitle','off', 'pos',[450 100 800 500] )
subplot(1,2,1);
grid
y1 = sin(x);
plot(x, y1, 'O')
hold on;

y2= Sin_1505080(x , 1);
plot(x , y2, 'green')
hold on;

y3= Sin_1505080(x , 3);
plot(x , y3, 'yellow')
hold on;

y4= Sin_1505080(x , 5);
plot(x , y4, 'blue')
hold on;

y5= Sin_1505080(x , 20);
plot(x , y5, 'red')
hold on;

xlabel('x');
ylabel('sin(x)');
grid;



z = 1 : 50 ;

val = zeros(1,50); 
app = zeros(1,50);

for i= 1 : 50;
    val(i) = Sin_1505080(1.5 , i);
end

app(1) = 100;

for i= 2 : 50;
    a = ( ( val(i) - val(i-1) ) / val (i) )*100;
   app(i) = abs(a);
   %app(i) = a;
end

subplot(1,2,2);
plot(z, app);

xlabel('Number of Iterations');
ylabel ('Relative Approx. Error (%)');

ylim([-10 100]);
grid;






