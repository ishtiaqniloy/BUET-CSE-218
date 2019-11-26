h= 0.5;
lo = 0;
hi = 4;
x = lo : h : hi;

%Analytical
f = @(x) (x.^4)/4 - (x.^3).*5/3 - (x.^2)/2+ 6.*x;
y = f(x)+1;
plot(x, y, 'b', x,y,'bd');
hold on;
grid on;

f = @(x) x.^3-5.*(x.^2)-x+6;
y(1,1) = 1;

%Euler
for i = 2 : 9
   y(1,i) = y(1,i-1) + f(x(1,i-1))*h;  
end
plot(x, y, 'r', x,y,'ro');

%Heun
for i = 2 : 9
   y(1,i) = y(1,i-1) + ( 0.5*f(x(1,i-1)) + 0.5*f(x(1,i-1)+h))*h;  
end
plot(x, y, 'g', x,y,'g^');

%Midpoint
for i = 2 : 9
   y(1,i) = y(1,i-1) + ( f(x(1,i-1)+0.5*h))*h;  
end
plot(x, y, 'c', x,y,'ch');

%Ralston
for i = 2 : 9
   y(1,i) = y(1,i-1) + ( f(x(1,i-1))/3 + 2*f(x(1,i-1)+3*h/4)/3 )*h;  
end
plot(x, y, 'y', x,y,'yp');


legend('Location', 'SouthWest', '','Analytical','', 'Euler', '', 'Heun', '', 'Midpoint', '', 'Ralston');

hold off;


