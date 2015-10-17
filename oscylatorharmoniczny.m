function oscylatorharmoniczny 

global m k 
m = 1250;
k = 1250;
[t,y]= ode45(@poch, [0,16], [0.2 0]);
a=(1/m)*(-k*y(:,1));
plot(t,y(:,1),'k',t,y(:,2),'--k',t,a,' :k','lineWidth',2)
legend('x','v','a')

function dy=poch(t,y)
global m k
dy = [y(2);(1/m)*(-k*y(1))];