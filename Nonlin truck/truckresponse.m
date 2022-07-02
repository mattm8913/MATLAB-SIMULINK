figure(1);clf;                  	% Select figure 1 and clear it
hold on;                        	% allow many plots on one page
Tmax = 5;                           % we want to simulate for 5 sec 
Tmin = 0;                           % we start at t=0
k= 3500;                            % lb/ft spring constant
m = 150;                            % lb sec^2/ft pound mass
height = 3;                         % ft height of car 
                                    % to be rolled over
bmin=input('Enter minimum B\n');		%  lb sec/ ft damping constant.
bmax=input('Enter maximum B\n');       %  Will be changed later!
db=(bmax-bmin)/4;
for b=bmin:db:bmax;
    sim('nonlinear');
    plot(t,z2,'b');
end
grid on
title(['Damping: b=',num2str(bmin),' to b=',num2str(bmax)]);
xlabel('Time (sec)');
ylabel('Position (ft)');
plot([0 5],[2 2],'r-');

