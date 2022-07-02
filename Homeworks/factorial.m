%% factorial function
function [n_factorial] =  factorial(N)
n_factorial=1;
if(N>=0)
    for ii=1:N
    n_factorial=n_factorial*ii;
    end
    fprintf('N!=%d\n',n_factorial);
elseif (N==0)
    n_factorial=1;
    fprintf('N!=%d\n',n_factorial);
else
    fprintf('Error: N must be a nonzero value\n')
end
end