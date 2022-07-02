%% Matt McVay
% 11/3/10
% HW #8

%% a)2.8 p.80
(3-4i)*(-4+3i)

%% b)2.10 p.81
h0=25; % h0=input('Enter initial height: ')
v0=-2.5; % v0=input('Enter initial vertical velocity in m/s: ')
t=0:.01:10;
h=-.5*9.81*t.^2 + v0*t+h0;
v=-9.81*t+v0;
plot(t,h,'b-',t,v,'g-');
xlabel('Time (s)');
ylabel('Height(m) / Velocity (m/s)');
legend('Height','Velocity','tr');
%% c)3.5 p.144
% function [f] = funxy(x,y)
if(x>=0)
    if (y>=0)
        f=x+y;
    else
        f=x+y^2;
    end
else
    if(y>=0)
        f=x^2+y;
    else
        f=x^2+y^2;
    end
end
%% d) 3.6 p.144
% input('x= ')
if(x<1&&x>=0)
y=log(1/(1-x));
else
    fprintf('Error: invalid value of x')
end
%% e) 3.14 p. 147
w=0:1:60;
R=16000;
C=1E-6;
f=1:2:1000;
res=(1i*2*pi*R*C.*f)./(1+1i*2*pi*R*C.*f);
amp=abs(res);
phase=angle(res);

loglog(f,amp);
title('Amplitude Response');
xlabel('Frequency (Hz)');
ylabel('Output-Input Ratio');
grid on;
% It's called a high-pass filter because v0=vi only at
% high requencies, otherwise very little voltage from
% vi reaches v0.
%% Spiral of Archimedes
theta=0:.001:6*pi;
r=.5.*theta;
polar(theta,r);
%% f) 4.5 p.195
% function [n_factorial] =  factorial(N)
% computes N! for N does not equal 0
% if N is 0, then N!=1
q=factorial(7);
q=factorial(0);
q=factorial(-2);
%% g) 5.21 p.256
% function [r2,phi2]=radar(r1,theta1,theta2,phi1,x1,y1,x2,y2)
% finds the range (r2) and relative bearing (phi2) to an object
% from ship#2 at (x2,y2) with heading theta2 given the
% range (r1) and relative bearing (ph1) from ship#1 with
% position (x1,y1) and heading theta1.  It also tells you where
% the object is.
radar(sqrt(18),030,045,15,0,0,6,0)
