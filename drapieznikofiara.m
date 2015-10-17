function drapieznikofiara
global a b c d;
%1'=ax-bxy - przyrost liczby ofiar w czasie
%2'=-cy+dxy - przyrost liczby drapieznikow w czasie
a = 2; %szybkosc narodzin ofiar
b = 0.2; %smiertelnosc ofiar wynikajaca ze zjedzenia przez drapieznika
c = 1; %smiertelnosc drapieznikow
d = 0.1; %skutecznosc polowan drapieznikow
[T,Y] = ode45(@rownania, [0,30],[50 10]);
plot(T,Y(:,1), '-',T,Y(:,2),'-.')
legend('ofiara','drapieznik')

function dy=rownania(t,y)
%y1'=ax-bxy - przyrost liczby ofiar w czasie
%y2'=-cy+dxy - przyrost liczby drapieznikow w czasie
global a b c d;
dy = [a*y(1)-b*y(1)*y(2)-c*(y)+d*y(1)*y(2)];