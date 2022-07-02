%% ES201 HW#7
%
% Matt McVay, 134506, 10/20/10
%% b) compute log base 10 of 201
format compact
a=log10(201)
%% c)1.4 p.20
u=1;
v=3;
a=(4*u)/(3*v)
b=(2*v^(-2))/(u+v)^2
c=(v^3)/(v^3-u^3)
d=(4/3)*pi*v^2
%% d) 2.1 p.79
% a) 4x5
% b) -3.5
c=[0.0 2.1 6.0;0.0 -6.6 3.4; 2.1 0.3 1.3; 1.1 0.0 -2.0] % c) 4x3,
d=[6.0;1.3] % d) 2x1
%% e) 2.2 p.79
% a) legal b) illegal c)legal d)illegal e)illegal
%% f) 3.2 p.144
a=input('What is your angle?  ');
if(cosd(a)>=10^-20)
    tangent=tand(a)
else
    fprintf('error: cos(a) is too small\n')
end
%% g) 3.3 p.144
% incorrect
if(temp<97.5)
    disp('Temperature below normal')
elseif((temp>=97.5)&&(temp<=99.5))
    disp('Temperature normal')
elseif((temp>=99.5)&&(temp<=103))
    disp('Temperature slighlty high')
elseif(temp>103)
    disp('Temperature dangerously high')
end
%% h) 3.4 p.144
weight=input('weight = ');
cost=15+(weight-2)*5;
if(weight>100)
    disp('package unaccceptable: too heavy')
elseif(weight>70)
    disp('package >70lbs, +15 dollar excess weight surcharge')
    cost=cost+15;
end
if(weight<=100)
fprintf(' cost = $%.2f\n',cost)
end
%% i) 4.7 p.196
% a) 21 times, ires=21
% b) 4 times, ires=22
% c) 2 times, ires=18
% d) 4 times, ires=24
%% j) 4.8 p.196
% a) 9 times, ires=10
% b) 7 times, ires=256
% c) 0 times, ires=2

    
