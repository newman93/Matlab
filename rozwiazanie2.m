function rozwiazanie2

[T,Y]=ode45(@rownanie, [0,5],1);
plot(T,Y, 'LineWidth',2.5)

function dy=rownanie(t,y)
dy(1)=y(1);