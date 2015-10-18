function wyplywcieczyzezbiornikow

[t,y] = ode45(@rownania,[0 1200],[1 0]);
plot(t,y,'-.')
legend('h_1', 'h_2')

function dh=rownania(t,h)
r = [1,1]; %promienie zbiornikow
A = pi*r.^2; %powierzchnia dna zbiornika
d = [0.1, 0.05]; %srednice otworow, przez ktore wyplywa ciecz
Aw = 0.25*pi*d.^2;
g = 9.81;
dh = zeros(2,1);
if t < 100
    Qd = 0.062;
else
    Qd = 0;
end
Q1w = (Aw(1)*(2*g*h(1))^0.5);
Q2w = (Aw(2)*(2*g*h(2))^0.5);
if h(1) < 0
    Q1w = 0;
end
if h(2) < 0
    Q2w = 0;
end
dh(1) = (Qd-Q1w)/A(1);
dh(2) = (Qd-Q2w)/A(2);