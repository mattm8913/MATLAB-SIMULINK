%% Project 2 SetUp
%% Open Serial Port
s=serial('COM1');
set(s, 'Parity', 'None');
set(s, 'StopBits', 1);
set(s, 'FlowControl', 'None');
set(s, 'TimeOut', 0.5);
fopen(s);