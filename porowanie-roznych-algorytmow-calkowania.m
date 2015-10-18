function porowanieroznychalgorytmowcalkowania

g = zeros(7,3,3);
ode = {@ode45,@ode23,@ode23tb,@ode23t,@ode23s,@ode15s,@ode113};
n = 1;
mi = [1000 500 1];
for i = 1:length(mi)
    dy = @(t,y)[y(2);mi(i)*(1-y(1)^2)*y(2)-y(1)];
    for method = 1:length(ode)
        for times = 1:3
            tic
            [t,y] = ode{method} (dy, [0 3000], [2;0]);
            g(method,n,times)=toc;
        end
        figure(i*2-1);
        hold on; 
        plot(y(:,1),y(:,2))
        title(['\mu=' num2str(mi(i))])
        figure(i*2);
        hold on;
        plot(t,y(:,1))
        title(['\mu=' num2str(mi(i))])
    end
    n = n+1;
end

G = mean(g,3);