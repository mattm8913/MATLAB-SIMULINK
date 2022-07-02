t=0;
tstart=tic;  %start timer
e=plot(0,0,'r-'); %start plot
hold on       %plot over previous values
while(s.BytesAvailable > 0)
    fread(s,1);  %Clear Buffer
end
while(1)
    while(s.BytesAvailable<2)
    end
    dat=fread(s,1,'int16'); %get data from C
    t=toc(tstart);          %keep track of time
    dat=(-.020979)*dat+55.923; %convert data to
    plot(t,dat,'o');        %distance from sensor
    pause(0.01);          %and plot
    while(s.BytesAvailable > 0)
    fread(s,1);          %clear buffer
    end
end