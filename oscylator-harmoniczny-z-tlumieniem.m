function oscylatorharmonicznyztlumieniem

MaxX = 0.36;
F = 250;
k = 1250;
m = 1250;
f = 0;
df = 1000;
ma = realmax;
t = [0 12];
eps = 1e-5;

while abs(ma-MaxX) >= eps
    [T,Y] = ode45(@rownania,t,[0 0],[],m,f,k,F);
    ma = max(Y(:,1));
    if ma < MaxX
        f = f-df;
        df = df/10;
    else
        f=f+df;
    end
end
x=[0.36 0.36]; %prosta, wartoœæ maksymalna
plot(T,Y(:,1),t,x);
sprintf('x_max=%10.8f,wsp. tlumienie f=%10.f',ma,f)

function dy=rownania(t,y,m,f,k,F)

dy = zeros(2,1);
dy(1)=y(2);
dy(2)=(F-f*y(2)-k*y(1))/m;