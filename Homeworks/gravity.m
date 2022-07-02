%% function gravity for 5.31 on p.261
function [Fg]=gravity(m1,m2,r2)
G=6.672E-11;
Fg=G*m1*m2/(r^2);
fprintf('Fg = %f\n',Fg);
end
%% Outputs
% a)
% ans =

%         0 +25.0000i

% b)

% e)

% N!=5040
% N!=1
% Error: N must be a nonzero value

% g)
% r2 = 4.243
% The Relative Bearing of the Object from Ship#2 is 270
% The Object is at (3.000,3.000)