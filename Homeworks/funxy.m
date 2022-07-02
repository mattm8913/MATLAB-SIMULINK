function [f] = funxy(x,y)
if(x>=0)
    if (y>=0)
        f=x+y;
    else
        f=x+y.^2;
    end
else
    if(y>=0)
        f=x.^2+y;
    else
        f=x.^2+y.^2;
    end
end