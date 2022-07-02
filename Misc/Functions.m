%% Functions 
%% div function
function [quotient] = div(a,b)
if(a>=b)            
  quotient=b/a;     % computes the quotient b/a if a>=b
end
if(b>a)
    quotient=a/b;   % copmutes the qotient a/b if b>a
end
end
%% Getit Function
function [o1,o2,o3] = getit(i1,i2)
o1=i1+i2;
o2=i1-i2;
o3=i1*i2;
end
%% Trig Function
function [c,s,t]=trig(angle) % Creates a function named "trig"
c=cosd(angle);      %Computes the cosine of the angle (in degrees)
s=sind(angle);      %Computes the sine of the angle (in degrees)
t=tand(angle);      %Computes the tangent of the angle (in degrees)
end