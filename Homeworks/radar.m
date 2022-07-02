%% radar function
function []=radar(r1,theta1,theta2,phi1,x1,y1,x2,y2)
Objectx=x1+r1*sind(theta1+phi1);
Objecty=y1+r1*cosd(theta1+phi1);
r2=sqrt((x2-Objectx)^2+(y2-Objecty)^2);
fprintf('r2 = %.3f\n',r2);
if(Objecty>y2)
    phi2=atand((Objectx-x2)/(Objecty-y2))-theta2;
elseif(Objecty<y2)
    phi2=atand((Objectx-x2)/(Objecty-y2))-theta2+180;
else
    if(Objectx>x2)
        phi2=90-theta2;
    elseif(Objectx<x2)
        phi2=270-theta2;
    else
        phi2=0;
    end
end
if(phi2>360)
    phi2=phi2-360;
end
if(phi2<0)
    phi2=phi2+360;
end
fprintf('The Relative Bearing of the Object from Ship#2 is %03d\n',phi2)
fprintf('The Object is at (%.3f,%.3f)\n',Objectx,Objecty)
end