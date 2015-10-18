function odbijaniesiesprezystejpilki

opcje = odeset('RelTol',1e-5,'AbsTol',[1e-5 1e-5],'MaxStep',0.1);
[T,Y] = ode45(@rownania,[0 10],[1 0],opcje);
plot(T,Y(:,1),'-')

function dy = rownania(t,y)

dy = zeros(2,1);
R = 0.1;
g = 9.81;
k = 1000;
f = 2;
m = 0.5;

dy(1) = y(2);

if y(1) <= R
    dy(2) = (-k*(y(1)-R)-f*y(2))/m+g;
else
    dy(2) = -g;
end