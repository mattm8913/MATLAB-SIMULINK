t=0;
tstart=tic;
e=plot(0,0,'r-');
hold on
while(s.BytesAvailable > 0)
    fread(s,1);
end
while(1)
    while(s.BytesAvailable<2)
    end
    dat=fread(s,1,'int16');
    t=toc(tstart);
    plot(t,dat,'o');
    pause(0.01);
    while(s.BytesAvailable > 0)
    fread(s,1);
    end
end
%% Ser Setup
a = instrfind();        % determine if any ports are open
if (~isempty(a))        % if they are…
    fclose(a);          % close them
end
s = serial('COM1');
   % use correct number% Set up COM1
set(s, 'Parity', 'None');   % use ‘Even’, ‘Odd’, etc.
set(s, 'BaudRate',9600);
set(s, 'StopBits', 1);      % use correct number, 1, 1.5 or 2
set(s, 'FlowControl', 'None');  % or ‘hardware’ or ‘software’
set(s, 'TimeOut', 0.5);     % limits waiting for data
fopen(s);           % opens the port.  
                % You cannot change most settings while open