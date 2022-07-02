%% Open Serial Port
s=serial('COM1');
set(s, 'BaudRate',9600);
set(s, 'Parity', 'None');
set(s, 'StopBits', 1);
set(s, 'FlowControl', 'None');
set(s, 'TimeOut', 0.5);
fopen(s); % already set to 8 data bits standard ASCII value
%% Storing Data
n=get(s, 'BytesAvailable');
dat=fscanf(s); % will get the next full line
dat2=fscanf(s, 4); % will get the next 4 characters
dat3=fscanf(s, '%d'); % will read integers into an array
%% Scanning Joystick Data
while(1)
dat=fscanf(s);  
[hdr,but,xax,yax,thr]=strread(dat,'%s%d%d%d%s',1,'delimiter',',');
thr=char(thr);
thr=str2num(thr(1:4));
if(bitand(but, 2^5)>0)
    fprintf('swf=0\n')
else
     fprintf('swf=1\n')
end
end
%% Scanning with try_catch
while(1)
dat=fscanf(s); 
try
[hdr,but,xax,yax,thr]=strread(dat,'%s%d%d%d%s',1,'delimiter',',');
thr=char(thr);
thr=str2num(thr(1:4));
good=1;
catch
    good=0;
end
if (good) %things you want to do with the data
    figure(1);
    plot(xax, yax, 'o', 'MarkerSize', (thr+1)/20);
    text(511, 511, dec2bin(but)); 
    axis([0 1031 0 1031]);
end
end