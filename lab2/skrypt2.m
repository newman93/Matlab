c=menu('Wybierz:','1. Okr¹g J=[0,1;-1,0]','2. Prosta pozioma J=[0,1;0,0]','3. Prosta pionowa J=[0,0;0,-1]','4. Kropka J=[0,0;0,0]','5. Prosta do œrodka J=[-1,0;0,-1]','6. Wir J=[0,1;-1,-1]','7. Hiperbola J=[-1,0;0,1]','8. Spirala J=[1,2;-2,1]','9. Parabola J=[-1 0; 0 -2]');
switch c
    case 1
        J=[0,1;-1,0]; % Okr¹g
    case 2
        J=[0,1;0,0]; % Prosta pozioma
    case 3
        J=[0,0;0,-1]; % Prosta pionowa
    case 4
        J=[0,0;0,0]; % Kropka
    case 5 
        J=[-1,0;0,-1]; % Prosta do œrodka
    case 6
        J=[0,1;-1,-1]; % Wir
    case 7
        J=[-1,0;0,1]; % Hiperbola
    case 8 
        J=[1,2;-2,1]; % Spirala 
    case 9
        J=[-1,0;0,-2]; % Parabola
end;

P=eye(2);       
A=P*J*inv(P);

WPC=[];
for j=-10:10
    
if (c==5 || c==6 || c==7 || c==8 || c==9)
    WPC(1) = sin(j); WPC(2) = cos(j);
    %WPC=[sin(j);cos(j)];
else
    WPC(3) = (3*j); WPC(4) = (4/3);
    %WPC=[3*j;j/3]; 
end;
    open 'model2';
    sim ('model2');
    plot(x(:,1),x(:,2));
    hold on;
end;
hold off;
